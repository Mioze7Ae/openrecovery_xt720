#!/sbin/sh


case $1 in
memhack)
echo "remove memhack..."
if [ -f "/system/bin/boot_script/61_memhack.sh" ];
then
rm -f /system/bin/boot_script/61_memhack.sh
rm -f /data/dalvik-cache
mkdir /data/dalvik-cache
chmod 771 /data/dalvik-cache
fi
sleep 1;;

overclock)
echo "remove overclock..."
if [ -f "/system/bin/boot_script/71_overclock.sh" ];
then
if [ -f "/system/lib/modules/overclock.ko" ];
then
rm -f /system/lib/modules/overclock.ko
fi
rm -f /system/bin/boot_script/71_overclock.sh
fi
sleep 1;;


apps2sd)
echo "remove apps2sd..."
if [ -f "/system/bin/boot_script/51_app2sd.sh" ];
then
if [ -f "/system/lib/modules/ext2.ko" ];
then
rm -f /system/lib/modules/ext2.ko
fi
rm -f /system/bin/boot_script/51_app2sd.sh
fi
sleep 1;;

mbm)
echo "restore mot_boot_mode..."
cp -f /sdcard/OpenRecovery/backup/bin/mot_boot_mode /system/bin/mot_boot_mode
chmod 755 /system/bin/mot_boot_mode
chown 0.2000 /system/bin/mot_boot_mode
sleep 1;;

flac)
echo "remove flac libs..."
cp -f /sdcard/OpenRecovery/backup/ocflac/framework.jar /system/framework/
rm -f /system/lib/libFLAC.so
cp -f /sdcard/OpenRecovery/backup/ocflac/libmediaplayerservice.so /system/lib/
cp -f /sdcard/OpenRecovery/backup/ocflac/libopencore_player.so /system/lib/
chmod 644 /system/framework/framework.jar
chmod 644 /system/lib/libmediaplayerservice.so
chmod 644 /system/lib/libopencore_player.so
sleep 1;;

jit)
echo "remove JiTv7..."
cp -f /sdcard/OpenRecovery/backup/jitbak/bin/* /system/bin/
chmod 755 /system/bin/*
chown 0.2000 /system/bin/*
cp -f /sdcard/OpenRecovery/backup/jitbak/lib/* /system/lib/
chmod 755 /system/lib/*
chown 0.0 /system/lib/*
cp -f /sdcard/OpenRecovery/backup/jitbak/build.prop /system/build.prop
chmod 777 /system/build.prop
sleep 1;;

esac