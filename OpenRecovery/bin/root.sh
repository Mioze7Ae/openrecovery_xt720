#!/sbin/bash

echo "Installing su..."

cp -f /sdcard/OpenRecovery/root/su /system/xbin/su
chmod 6755 /system/xbin/su

echo "Installing Superuser.apk..."

cp -f /sdcard/OpenRecovery/root/Superuser.apk /system/app/Superuser.apk
chmod 0644 /system/app/Superuser.apk

if [ -f /system/bin/su ]; then
	rm -f /system/bin/su
fi
