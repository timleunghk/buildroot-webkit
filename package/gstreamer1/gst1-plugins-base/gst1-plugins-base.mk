################################################################################
#
# gst1-plugins-base
#
################################################################################

GST1_PLUGINS_BASE_VERSION = 1.14.4

ifeq ($(BR2_PACKAGE_GSTREAMER1_10),y)
GST1_PLUGINS_BASE_VERSION = 1.10.4
endif

ifeq ($(BR2_PACKAGE_GSTREAMER1_14),y)
GST1_PLUGINS_BASE_VERSION = 1.14.4
endif

GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
GST1_PLUGINS_BASE_INSTALL_STAGING = YES
GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
GST1_PLUGINS_BASE_LICENSE = LGPLv2+, LGPLv2.1+

ifeq ($(BR2_PACKAGE_GSTREAMER1_GIT),y)
GST1_PLUGINS_BASE_SITE = http://cgit.freedesktop.org/gstreamer/gst-plugins-base/snapshot
BR_NO_CHECK_HASH_FOR += $(GST1_PLUGINS_BASE_SOURCE)
GST1_PLUGINS_BASE_AUTORECONF = YES
GST1_PLUGINS_BASE_AUTORECONF_OPTS = -I $(@D)/common/m4
GST1_PLUGINS_BASE_GETTEXTIZE = YES
GST1_PLUGINS_BASE_POST_EXTRACT_HOOKS += GSTREAMER1_COMMON_EXTRACT
GST1_PLUGINS_BASE_PRE_CONFIGURE_HOOKS += GSTREAMER1_FIX_AUTOPOINT
GST1_PLUGINS_BASE_POST_INSTALL_TARGET_HOOKS += GSTREAMER1_REMOVE_LA_FILES
endif

# freetype is only used by examples, but if it is not found
# and the host has a freetype-config script, then the host
# include dirs are added to the search path causing trouble
GST1_PLUGINS_BASE_CONF_ENV =
	FT2_CONFIG=/bin/false \
	ac_cv_header_stdint_t="stdint.h"

# gio_unix_2_0 is only used for tests
GST1_PLUGINS_BASE_CONF_OPTS = \
	CFLAGS="$(TARGET_CFLAGS) $(GSTREAMER1_EXTRA_COMPILER_OPTIONS)" \
	--disable-examples \
	--disable-oggtest \
	--disable-vorbistest \
	--disable-gio_unix_2_0 \
	--disable-freetypetest \
	--disable-valgrind

# Options which require currently unpackaged libraries
GST1_PLUGINS_BASE_CONF_OPTS += \
	--disable-cdparanoia \
	--disable-libvisual \
	--disable-iso-codes

GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1

# These plugins are liste in the order from ./configure --help

ifeq ($(BR2_PACKAGE_ORC),y)
GST1_PLUGINS_BASE_DEPENDENCIES += orc
GST1_PLUGINS_BASE_CONF_OPTS += --enable-orc
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-adder
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-adder
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-app
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-app
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-audioconvert
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioconvert
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiorate
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiorate
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiotestsrc
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiotestsrc
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-encoding
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-encoding
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-videoconvert
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-videoconvert
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-gio
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-gio
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-playback
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-playback
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-audioresample
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioresample
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-subparse
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-subparse
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-tcp
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-tcp
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-typefind
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-typefind
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-videotestsrc
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-videotestsrc
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-videorate
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-videorate
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-videoscale
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-videoscale
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-volume
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-volume
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
GST1_PLUGINS_BASE_DEPENDENCIES += zlib
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-zlib
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
GST1_PLUGINS_BASE_CONF_OPTS += \
	--enable-x \
	--enable-xshm \
	--enable-xvideo
else
GST1_PLUGINS_BASE_CONF_OPTS += \
	--disable-x \
	--disable-xshm \
	--disable-xvideo
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA),y)
GST1_PLUGINS_BASE_DEPENDENCIES += alsa-lib
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-alsa
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-ivorbis
GST1_PLUGINS_BASE_DEPENDENCIES += tremor
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-ivorbis
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-opus
GST1_PLUGINS_BASE_DEPENDENCIES += opus
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-opus
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-ogg
GST1_PLUGINS_BASE_DEPENDENCIES += libogg
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-ogg
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-pango
GST1_PLUGINS_BASE_DEPENDENCIES += pango
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-pango
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-theora
GST1_PLUGINS_BASE_DEPENDENCIES += libtheora
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-theora
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS),y)
GST1_PLUGINS_BASE_CONF_OPTS += --enable-vorbis
GST1_PLUGINS_BASE_DEPENDENCIES += libvorbis
else
GST1_PLUGINS_BASE_CONF_OPTS += --disable-vorbis
endif

ifeq ($(BR2_PACKAGE_VSS_SDK),y)
# this platform needs to run this gstreamer version parallel
# to an older version.
GST1_PLUGINS_BASE_AUTORECONF = YES
GST1_PLUGINS_BASE_AUTORECONF_OPTS = -I $(@D)/common/m4
GST1_PLUGINS_BASE_GETTEXTIZE = YES
GST1_PLUGINS_BASE_CONF_OPTS += \
	--datadir=/usr/share/gstreamer-wpe \
	--datarootdir=/usr/share/gstreamer-wpe \
	--sysconfdir=/etc/gstreamer-wpe \
	--includedir=/usr/include/gstreamer-wpe \
	--program-prefix wpe
define GST1_PLUGINS_BASE_APPLY_VSS_FIX
 package/vss-sdk/gst1/gst1.plugins.fix.sh ${@D}
endef
GST1_PLUGINS_BASE_POST_PATCH_HOOKS += GST1_PLUGINS_BASE_APPLY_VSS_FIX
endif

$(eval $(autotools-package))
