#!/bin/sh
BOARD_DIR="$(dirname $0)"
ROOTFS_DIR="${BINARIES_DIR}/../rootfs"
ROOTFS_FILES="${BINARIES_DIR}/rootfs.files"
STAR="*"

# Clean up target
rm -rf "${TARGET_DIR}/usr/lib/gstreamer-1.0/include"
rm -rf "${TARGET_DIR}/usr/lib/libstdc++.so.6.0.20-gdb.py"
rm -rf "${TARGET_DIR}/etc/ssl/man"

# Temp rootfs dir
mkdir -p "${ROOTFS_DIR}"

# Create files list for rsync
rm -rf "${ROOTFS_FILES}"
while read line
do
	find "${TARGET_DIR}" -name "$line$STAR" -printf "%P\n" >> "${ROOTFS_FILES}"
done < "${BOARD_DIR}/horizon.txt"

# Append missing folders
echo "usr/lib/gstreamer-1.0" >> "${ROOTFS_FILES}"
echo "usr/lib/gio" >> "${ROOTFS_FILES}"
echo "usr/share/X11" >> "${ROOTFS_FILES}"
echo "usr/share/mime" >> "${ROOTFS_FILES}"
echo "etc/playready" >> "${ROOTFS_FILES}"
echo "etc/ssl" >> "${ROOTFS_FILES}"
echo "etc/fonts" >> "${ROOTFS_FILES}"

rsync -ar --files-from="${ROOTFS_FILES}" "${TARGET_DIR}" "${ROOTFS_DIR}"

# Default font
mkdir -p "${ROOTFS_DIR}/usr/share/fonts/ttf-bitstream-vera"
cp -f "${TARGET_DIR}/usr/share/fonts/ttf-bitstream-vera/Vera.ttf" "${ROOTFS_DIR}/usr/share/fonts/ttf-bitstream-vera/"

# WebBridge startup script
mkdir -p "${ROOTFS_DIR}/NDS"
cp -pf "${BOARD_DIR}/horizon/webbridge" "${ROOTFS_DIR}/NDS"
#cp -pf "${BOARD_DIR}/horizon/webbridge-stub" "${ROOTFS_DIR}/NDS"
#cp -pf "${BOARD_DIR}/horizon/libegl_log.so" "${ROOTFS_DIR}/NDS"
#cp -pf "${BOARD_DIR}/horizon/libgl2_log.so" "${ROOTFS_DIR}/NDS"

# WebServer path
mkdir -p "${ROOTFS_DIR}/www"

# Create tar
tar -cvf "${BINARIES_DIR}/horizon.tar" -C "${ROOTFS_DIR}" .

# Cleaning up
rm -rf "${ROOTFS_FILES}"
rm -rf "${ROOTFS_DIR}"
