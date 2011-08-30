#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 36 > /proc/overclock/max_vsel
echo 550000 > /proc/overclock/max_rate
echo "1 400000" > /proc/overclock/freq_table
echo "4 400000000 32" > /proc/overclock/mpu_opps
echo "2 250000" > /proc/overclock/freq_table
echo "3 250000000 28" > /proc/overclock/mpu_opps
echo "3 125000" > /proc/overclock/freq_table
echo "2 125000000 16" > /proc/overclock/mpu_opps
