#!/sbin/bash
replacement=s/dalvik.vm.heapsize=.*/dalvik.vm.heapsize=$1/ 
sed -i $replacement /system/build.prop

rm -Rf /data/dalvik-cache/*