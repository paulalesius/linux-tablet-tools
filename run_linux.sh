#!/bin/bash

. ./check.sh

# Make boot.img
external/mkbootimg.git/mkbootimg --cmdline "noinitrd vmalloc=512M debug_locks=0 bootboost=1 nomodeset vga=current i915.modeset=0 drm.vblankoffdelay=1 acpi_backlight=vendor i915.mipi_panel_id=3 root=/dev/mmcblk1p1 selinux=0 rw noresume init=/usr/lib/systemd/systemd --system" --base 0x00100000 --kernel prebuilt/kernel --ramdisk prebuilt/initramfs-empty.img --dt prebuilt/dt.img -o prebuilt/boot-linux.img

fastboot flash osloader prebuilt/bootx64.efi
fastboot -S 10M boot prebuilt/boot-linux.img

