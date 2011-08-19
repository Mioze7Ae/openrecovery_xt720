#!/sbin/sh

umount /sdcard
fsck_msdos -fy /dev/block/mmcblk0p1
mount /sdcard
