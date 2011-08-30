#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 56 > /proc/overclock/max_vsel
echo 650000 > /proc/overclock/max_rate
