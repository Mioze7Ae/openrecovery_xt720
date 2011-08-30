#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 56 > /proc/overclock/max_vsel
echo 900000 > /proc/overclock/max_rate
echo "1 700000" > /proc/overclock/freq_table
echo "4 700000000 46" > /proc/overclock/mpu_opps
echo "2 500000" > /proc/overclock/freq_table
echo "3 500000000 36" > /proc/overclock/mpu_opps
echo "3 250000" > /proc/overclock/freq_table
echo "2 250000000 26" > /proc/overclock/mpu_opps
