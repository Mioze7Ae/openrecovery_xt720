#!/system/xbin/sh

if [ ! -d /data/app_sdcard ]; then 
	mkdir /data/app_sdcard
	chmod 777 /data/app_sdcard
fi

mount /dev/block/mmcblk0p2 /data/app_sdcard
rm -fR /data/app_sdcard/*