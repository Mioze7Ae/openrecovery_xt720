#!/system/bin/sh

if [ ! -f /sdcard/openrecovery/sbin/busybox ]; then
	echo "Cannot find busybox - sdcard part of OpenRecovery not installed."
	exit 2
fi

if [ ! -d "/sdcard/openrecovery/orbootstrap/$1" ]; then
	echo "Cannot find bootstrap part - not installed."
	exit 2
fi

BUSYBOX=/tmp/busybox

cp /sdcard/openrecovery/sbin/busybox $BUSYBOX
chmod 777 $BUSYBOX

#now check using Busybox [ if we have first argument

if $BUSYBOX [ "$1" == "" ]; then
	$BUSYBOX rm $BUSYBOX
	echo "No phone specified."
	exit 2
fi

#copying

$BUSYBOX mount -o remount,rw /system

if [ -d /system/persistent ]; then
	$BUSYBOX rm -R /system/persistent
fi
 
$BUSYBOX mkdir /system/persistent
$BUSYBOX cp -R "/sdcard/openrecovery/orbootstrap/$1" /system/persistent
$BUSYBOX mv "/system/persistent/$1" /system/persistent/orbootstrap

#sh

$BUSYBOX rm /system/bin/sh
$BUSYBOX cp /system/persistent/orbootstrap/sh /system/bin/sh

#tag
$BUSYBOX touch /system/persistent/.persistent_sh

#permissions

$BUSYBOX chown 0:2000 /system/bin/sh
$BUSYBOX chmod 755 /system/bin/sh

$BUSYBOX chown -R 0:0 /system/persistent/orbootstrap/

$BUSYBOX chmod -R 644 /system/persistent/orbootstrap/res
$BUSYBOX chmod -R 644 /system/persistent/orbootstrap/menu
$BUSYBOX chmod -R 644 /system/persistent/orbootstrap/etc
$BUSYBOX chmod -R 755 /system/persistent/orbootstrap/sbin
$BUSYBOX chmod -R 755 /system/persistent/orbootstrap/utils

$BUSYBOX chmod -R 644 /system/persistent/orbootstrap/default.prop
$BUSYBOX chmod -R 755 /system/persistent/orbootstrap/init.rc

#symlinks
CWD="$PWD"
cd /system/persistent/orbootstrap/utils 
$BUSYBOX ln -s bootstrapbox cp
$BUSYBOX ln -s bootstrapbox mkdir
$BUSYBOX ln -s bootstrapbox mount
$BUSYBOX ln -s bootstrapbox rm
$BUSYBOX ln -s bootstrapbox rmdir
$BUSYBOX ln -s bootstrapbox umount
cd "$CWD"

#reboot (only if there is toolbox)

if [ -f /system/bin/toolbox ]; then

	$BUSYBOX rm /system/bin/reboot
	$BUSYBOX cp /system/persistent/orbootstrap/reboot /system/bin/reboot
	
	$BUSYBOX chown 0:2000 /system/bin/reboot
	$BUSYBOX chmod 755 /system/bin/reboot
	
fi

#delete /tmp/busybox
$BUSYBOX rm $BUSYBOX

echo "Installation done."
