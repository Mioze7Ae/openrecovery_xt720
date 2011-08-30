#!/sbin/sh

echo "AutoBoot Recovery"
echo ""

echo "modifying boot..."
mkdir -p /sdcard/OpenRecovery/backup/bin
cp -f /system/bin/mot_boot_mode.bin /sdcard/OpenRecovery/backup/bin/mot_boot_mode
cp -f /sdcard/OpenRecovery/mod/system/bin/mot_boot_mode /system/bin/mot_boot_mode
chmod 755 /system/bin/mot_boot_mo*
chown 0.2000 /system/bin/mot_boot_mo*

echo "copying scripts..."

if [ ! -d "/system/bin/boot_script" ];
then
mkdir /system/bin/boot_script
fi

cp -fR /sdcard/OpenRecovery/mod/system/bin/boot_script/60_autoboot_or.sh /system/bin/boot_script/60_autoboot_or.sh

chmod -R 755 /system/bin/boot_script
chown -R 0.2000 /system/bin/boot_script

sleep 1
