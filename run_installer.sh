#!/bin/bash

. ./check.sh

# Speed up during development by skipping the unpack step
# unpack command
[[ ! -d tmp ]] && mkdir tmp
tar -xjf prebuilt/initramfs-installer.tar.bz2 -C tmp/

# Copy scripts
cp -r custom/* tmp/

# Package initrd
cd tmp/ && find . | cpio -R 0:0 -H newc -o | bzip2 -9 > ../prebuilt/initramfs-installer.img && cd -

# Package boot.img
external/mkbootimg.git/mkbootimg --cmdline "nmi_watchdog=0 nomodeset i915.modeset=0 lttcmd=$1 panic=0" --base 0x00100000 --kernel prebuilt/kernel --ramdisk prebuilt/initramfs-installer.img --dt prebuilt/dt.img -o prebuilt/boot-installer.img

# Boot
fastboot flash osloader prebuilt/bootx64.efi
fastboot boot prebuilt/boot-installer.img

