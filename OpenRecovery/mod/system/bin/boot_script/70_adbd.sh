#!/system/bin/sh

mount -o remount,rw rootfs /

#exchange the props and restart adbd
stop adbd

rm /default.prop
rm /sbin/adbd

cp /system/bin/boot_script/data/default.prop /default.prop
cp /system/bin/boot_script/data/adbd /sbin/adbd

start adbd

mount -o remount,ro rootfs /
