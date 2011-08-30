#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 65 > /proc/overclock/max_vsel
echo 1100000 > /proc/overclock/max_rate
echo "1 750000" > /proc/overclock/freq_table
echo "4 750000000 50" > /proc/overclock/mpu_opps
echo "2 500000" > /proc/overclock/freq_table
echo "3 500000000 40" > /proc/overclock/mpu_opps
echo "3 250000" > /proc/overclock/freq_table
echo "2 250000000 30" > /proc/overclock/mpu_opps
