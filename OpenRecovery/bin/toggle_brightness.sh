#!/sbin/bash

brightness=$(cat /sys/class/leds/lcd-backlight/brightness)
if [ $brightness = 255 ] ; then
    echo 20 > /sys/class/leds/lcd-backlight/brightness
else
    echo 255 > /sys/class/leds/lcd-backlight/brightness
fi
