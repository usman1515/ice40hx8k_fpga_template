# ice40HX8K FPGA

## Introduction

The ice40HX8K is a low cost development board for iCE40 FPGA family from Lattice Semiconductor. The fun fact about this family of FPGAs is a complete end to end FOSS toolchain.

For detailed specs on the board check out the main webpage [here](https://www.olimex.com/Products/FPGA/iCE40/iCE40HX8K-EVB/open-source-hardware).

We will use a [raspberry pi 3B board](https://www.raspberrypi.com/products/raspberry-pi-3-model-b/) for the following:
- design simulation
- synthesis
- implementation
- bitstream generation
- bitstream upload

## Setup

### Setup a Raspberry Pi

- Download the iso [raspberry Pi OS with desktop and recommended software](https://www.raspberrypi.com/software/operating-systems/).
- Use [balena etcher](https://etcher.balena.io/) to flash the ISO on the SD card.


### Setup OSS CAD Suite
- Download the latest release of Linux ARM64 [OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build/releases) toolchain from Github.

```bash
# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# download archive and move here
wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2025-03-16/oss-cad-suite-linux-arm64-20250316.tgz

# extract archive
tar -zxvf oss-cad-suite-linux-arm64-20250316.tgz -C ~/Tools

# rename folder
mv -v oss-cad-suite oss-cad-suite-<release-date>
```
