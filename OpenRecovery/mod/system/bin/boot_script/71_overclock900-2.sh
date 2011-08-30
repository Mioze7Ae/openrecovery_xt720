#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 56 > /proc/overclock/max_vsel
echo 900000 > /proc/overclock/max_rate
echo "1 600000" > /proc/overclock/freq_table
echo "4 600000000 42" > /proc/overclock/mpu_opps
echo "2 400000" > /proc/overclock/freq_table
echo "3 400000000 34" > /proc/overclock/mpu_opps
echo "3 125000" > /proc/overclock/freq_table
echo "2 125000000 22" > /proc/overclock/mpu_opps
