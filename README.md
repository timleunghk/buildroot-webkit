TimOS
=====


## About
TimOS is base on Buildroot with Webkit modules. It is available for raspberry pi 3B plus,

## Getting started

### Installation

Clone this repository:
```
https://github.com/timleunghk/buildroot-webkit.git
```
### Preparations

1. Ubuntu 16.04
2. Update to latest components

```
sudo apt-get update
```

3. Install the following components

```
sudo apt-get install -y git subversion bc zip build-essential bison flex gettext libncurses5-dev texinfo autoconf automake libtool libpng12-dev libglib2.0-dev libgtk2.0-dev gperf libxt-dev ccache mtools
```

### Configuration

Select a configuration for your embedded device from the `configs/` directory. For example for the Raspberry Pi 2 device:
```
make timrpi3_defconfig
```


### Build
To build:
```
make
```

Once completed the buildroot provides you with an `output/images` directory that contains the kernel image, root filesystem and optionally firmware packages (if RPI is used) to run the complete linux environment and the WPE browser.

The filename of the image should be sdcard.img. You can copy it from `output/images` directory to other folders and write it into SD Card by using Ecther.

For more information on buildroot way of working please see their documentation: https://buildroot.org/downloads/manual/manual.html

## Usage
To launch the browser:
```
wpe <url>
```

Additionally (by default) there is a WebInspector enabled which can be reached at:
```
http://<ip of your target machine>:9998/
```

**Note** This requires a ES6 compatible browser. For example Safari nightly. 

## Supported devices

WPE is verified and being tested by Metrological on the following devices:

 - Raspberry Pi 3B Plus


**Note** that other devices may be supported through buildroot. But mileage may vary when it comes down to video playback and graphics performance.
