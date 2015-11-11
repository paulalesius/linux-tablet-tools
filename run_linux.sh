#!/bin/bash

. ./check.sh

# Make boot.img
external/mkbootimg.git/mkbootimg --cmdline "noinitrd i915.preliminary_hw_support=1 root=/dev/mmcblk0p14 selinux=0" --base 0x00100000 --kernel prebuilt/kernel --ramdisk prebuilt/initramfs-empty.img --dt prebuilt/dt.img -o prebuilt/boot-linux.img

fastboot flash osloader prebuilt/bootx64.efi
fastboot -S 10M boot prebuilt/boot-linux.img

