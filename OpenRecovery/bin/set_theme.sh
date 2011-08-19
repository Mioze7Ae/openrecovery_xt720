#!/sbin/bash

echo "$1" > /etc/theme
echo "$1" > /sdcard/OpenRecovery/etc/theme

rm -fR /res

if [ -d /sdcard/OpenRecovery/$1 ]; then
	cp -fR /sdcard/OpenRecovery/$1/ /
	mv -f /$1 /res
fi

RPID=`ps | grep /sbin/recovery | awk '{print $1}'`
echo "kill process $RPID..."
kill -9 $RPID
