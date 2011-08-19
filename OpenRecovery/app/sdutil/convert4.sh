#!/sbin/sh

if ! grep -q " /sddata " /proc/mounts ; then
    echo ERROR: /sddata is not mounted
    exit
fi

umount /sddata
e2fsck -fy /dev/block/mmcblk0p2
tune2fs -O has_journal,extents,uninit_bg,dir_index /dev/block/mmcblk0p2
e2fsck -fyDC0 /dev/block/mmcblk0p2
mount /sddata
