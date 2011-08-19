#!/sbin/sh

umount /sddata
e2fsck -fy /dev/block/mmcblk0p2
mount /sddata
