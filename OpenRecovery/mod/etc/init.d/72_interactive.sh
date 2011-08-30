#!/system/bin/sh

/system/bin/insmod /system/lib/modules/symsearch.ko
/system/bin/insmod /system/lib/modules/cpufreq_conservative.ko
#echo conservative > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo 125000 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/sampling_rate

/system/bin/insmod /system/lib/modules/cpufreq_interactive.ko
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor


