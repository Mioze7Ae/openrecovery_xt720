#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 58 > /proc/overclock/max_vsel
echo 1000000 > /proc/overclock/max_rate
echo "1 750000" > /proc/overclock/freq_table
echo "4 750000000 46" > /proc/overclock/mpu_opps
echo "2 400000" > /proc/overclock/freq_table
echo "3 400000000 36" > /proc/overclock/mpu_opps
echo "3 125000" > /proc/overclock/freq_table
echo "2 125000000 23" > /proc/overclock/mpu_opps
