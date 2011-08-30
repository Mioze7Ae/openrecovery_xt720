#!/sbin/sh

echo "Bootanimation"
echo ""
echo "copying media..."

cp -r /sdcard/OpenRecovery/mod/bootanimation.zip /system/media/bootanimation.zip

chmod 644 /system/media/bootanimation.zip
chown -R 0.2000 /system/media

sleep 1
