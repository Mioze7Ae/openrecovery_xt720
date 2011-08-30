#!/sbin/sh

echo "Overclock 800/600/250/125"
echo ""

echo "modifying boot..."

if [ ! -f "/system/bin/mot_boot_mode1" ];
then
	mkdir -p /sdcard/OpenRecovery/backup/bin
	cp -f /system/bin/mot_boot_mode /sdcard/OpenRecovery/backup/bin/mot_boot_mode
	cp -f /system/bin/mot_boot_mode /system/bin/mot_boot_mode1
else
	mkdir -p /sdcard/OpenRecovery/backup/bin
	cp -f /system/bin/mot_boot_mode.bin /sdcard/OpenRecovery/backup/bin/mot_boot_mode
fi
cp -f /sdcard/OpenRecovery/mod/system/bin/mot_boot_mode /system/bin/mot_boot_mode
chmod 755 /system/bin/mot_boot_mo*
chown 0.2000 /system/bin/mot_boot_mo*

echo "copying libs..."

cp -f /sdcard/OpenRecovery/mod/system/lib/modules/overclock_milestone_21.ko /system/lib/modules/overclock.ko
chmod 644 /system/lib/modules/overclock.ko
chown -R 0.2000 /system/lib/modules

echo "copying scripts..."

if [ ! -d "/system/bin/boot_script" ];
then
mkdir /system/bin/boot_script
fi

cp -fR /sdcard/OpenRecovery/mod/system/bin/boot_script/71_overclock900-2.sh /system/bin/boot_script/71_overclock.sh


chmod -R 755 /system/bin/boot_script
chown -R 0.2000 /system/bin/boot_script


sleep 1
