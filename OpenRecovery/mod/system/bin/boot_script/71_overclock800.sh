#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 56 > /proc/overclock/max_vsel
echo 800000 > /proc/overclock/max_rate
echo "1 600000" > /proc/overclock/freq_table
echo "4 600000000 50" > /proc/overclock/mpu_opps
echo "2 250000" > /proc/overclock/freq_table
echo "3 250000000 30" > /proc/overclock/mpu_opps
echo "3 125000" > /proc/overclock/freq_table
echo "2 125000000 22" > /proc/overclock/mpu_opps
