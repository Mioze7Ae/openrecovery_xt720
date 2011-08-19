#!/sbin/bash

#unmount the sdcard
umount /sdcard

echo "Enabling USB Mass Storage Mode..." 

#mount it to PC
echo "/dev/block/mmcblk0p1" > /sys/devices/platform/usb_mass_storage/lun0/file

#use imenu to wait for user response
imenu "USB Mass Storage Mode Enabled" "Disable" > /dev/null

#unmount it from PC
echo "" > /sys/devices/platform/usb_mass_storage/lun0/file

echo "Disabling USB Mass Storage Mode..." 

#mount it back
mount /sdcard
