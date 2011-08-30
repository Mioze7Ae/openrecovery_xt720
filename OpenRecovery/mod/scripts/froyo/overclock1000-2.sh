#!/sbin/sh

echo "Overclock 1000/750/500/250"
echo ""

echo "copying libs..."

cp -f /sdcard/OpenRecovery/mod/system/lib/modules/overclock22.ko /system/lib/modules/overclock.ko
cp -f /sdcard/OpenRecovery/mod/system/lib/modules/symsearch.ko /system/lib/modules/symsearch.ko
chmod 644 /system/lib/modules/overclock.ko
chmod 644 /system/lib/modules/symsearch.ko
chown -R 0.2000 /system/lib/modules

echo "copying scripts..."

cp -fR /sdcard/OpenRecovery/mod/system/bin/boot_script/71_overclock1000-2.sh /system/etc/init.d/10overclock


chmod -R 755 /system/etc/init.d
chown -R 0.2000 /system/etc/init.d


sleep 1
