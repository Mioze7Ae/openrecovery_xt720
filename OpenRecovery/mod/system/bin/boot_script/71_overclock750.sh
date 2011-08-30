#!/system/bin/sh

insmod /system/lib/modules/symsearch.ko
insmod /system/lib/modules/overclock.ko


echo 45 > /proc/overclock/max_vsel
echo 750000 > /proc/overclock/max_rate
echo "1 500000" > /proc/overclock/freq_table
echo "4 500000000 36" > /proc/overclock/mpu_opps
echo "2 250000" > /proc/overclock/freq_table
echo "3 250000000 26" > /proc/overclock/mpu_opps
echo "3 125000" > /proc/overclock/freq_table
echo "2 125000000 18" > /proc/overclock/mpu_opps
