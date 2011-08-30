#!/sbin/bash

echo "$1" > /sys/class/leds/lcd-backlight/brightness
echo "$1" > /sdcard/OpenRecovery/etc/brightness
