#!/sbin/bash
replacement=s/ro.sf.lcd_density=.*/ro.sf.lcd_density=$1/ 
sed -i $replacement /system/build.prop