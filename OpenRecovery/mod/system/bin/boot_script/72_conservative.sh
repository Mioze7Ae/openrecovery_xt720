#!/system/bin/sh

insmod /system/lib/modules/cpufreq_interactive.ko nr_running_addr=0xc00550f0
#echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

insmod /system/lib/modules/cpufreq_conservative.ko
echo conservative > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 125000 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/sampling_rate
echo 25 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/freq_step

