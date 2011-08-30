#!/system/bin/sh
sysctl -p
#
#Disable normalized sleeper
#
mount -t debugfs none /sys/kernel/debug
echo NO_NORMALIZED_SLEEPER > /sys/kernel/debug/sched_features
#
#  Memory management
#
/system/xbin/echo 2048 > /proc/sys/kernel/msgmni
/system/xbin/echo 64000 > /proc/sys/kernel/msgmax
/system/xbin/echo 268435456 > /proc/sys/kernel/shmmax
/system/xbin/echo 500 512000 64 2048 > /proc/sys/kernel/sem
/system/xbin/sysctl -w kernel.sched_latency_ns=600000
/system/xbin/sysctl -w kernel.sched_min_granularity_ns=400000
/system/xbin/sysctl -w kernel.sched_wakeup_granularity_ns=400000
/system/xbin/sysctl -w kernel.sched_compat_yield=1
/system/xbin/sysctl -w kernel.sched_shares_ratelimit=256000
/system/xbin/sysctl -w kernel.sched_child_runs_first=0
/system/xbin/sysctl -w kernel.hung_task_timeout_secs=0
/system/xbin/sysctl -w kernel.threads-max=5000