#!/sbin/bash

#set display brightness
if [ -f /sdcard/OpenRecovery/etc/brightness ] ; then
    cat /sdcard/OpenRecovery/etc/brightness > /sys/class/leds/lcd-backlight/brightness
fi

#kill all services first
killall -9 adbd
killall -9 recovery
echo "msc_adb" > /dev/usb_device_mode &

#then continue with the remains
killall -9 sleep
killall -9 updater
