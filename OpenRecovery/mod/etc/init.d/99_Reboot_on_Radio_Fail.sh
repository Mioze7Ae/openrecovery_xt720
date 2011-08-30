#!/system/bin/sh

echo 255 > /sys/class/leds/green/brightness
sleep 1
echo 0 > /sys/class/leds/green/brightness

while
do 
if [ -e /data/panic/bp_panic.log1 ] ; then
	cp -f /data/panic/bp_panic.log1 /data/panic/log1
	rm /data/panic/bp_panic.log1
	echo "`date +'%Y %d %m %H:%M'` : Reboot on Radio Fail" >> /sdcard/radiofail.txt
	/yellow
#	/system/bin/stop ril-daemon
	sleep 1
	/yellow
#	/system/bin/start ril-daemon
	reboot
fi
sleep 5
done