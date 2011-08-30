#!/sbin/sh
echo "Automatic ZipAlign by 89luca89"
echo ""
echo "Starting Automatic ZipAlign $( date +"%m-%d-%Y %H:%M:%S" )" 
echo ""
		for apk in /data/app/*.apk ; do
		/sdcard/OpenRecovery/mod/zipalign/zipalign -c 4 $apk;
		ZIPCHECK=$?;
		if busybox [ $ZIPCHECK -eq 1 ]; then
		echo ZipAligning $(busybox basename $apk)  
		/sdcard/OpenRecovery/mod/zipalign/zipalign -f 4 $apk /cache/$(busybox basename $apk);
		if busybox [ -e /cache/$(busybox basename $apk) ]; then
		busybox cp -f -p /cache/$(busybox basename $apk) $apk  
		busybox rm /cache/$(busybox basename $apk);
		else
		echo ZipAligning $(busybox basename $apk) Failed  
		fi;
		else
		echo ZipAlign already completed on $apk  
		fi;
		done;
		for apk in /data/app-private/*.apk ; do
		/sdcard/OpenRecovery/mod/zipalign/zipalign -c 4 $apk;
		ZIPCHECK=$?;
		if busybox [ $ZIPCHECK -eq 1 ]; then
		echo ZipAligning $(busybox basename $apk)  
		/sdcard/OpenRecovery/mod/zipalign/zipalign -f 4 $apk /cache/$(busybox basename $apk);
		if busybox [ -e /cache/$(busybox basename $apk) ]; then
		busybox cp -f -p /cache/$(busybox basename $apk) $apk  
		busybox rm /cache/$(busybox basename $apk);
		else
		echo ZipAligning $(busybox basename $apk) Failed  
		fi;
		else
		echo ZipAlign already completed on $apk 
		fi;
		done;
		mount -o remount,rw -t yaffs2 /dev/block/mtdblock4 /system
		for apk in /system/app/*.apk ; do
		/sdcard/OpenRecovery/mod/zipalign/zipalign -c 4 $apk;
		ZIPCHECK=$?;
		if busybox [ $ZIPCHECK -eq 1 ]; then
		echo ZipAligning $(busybox basename $apk)  
		/sdcard/OpenRecovery/mod/zipalign/zipalign -f 4 $apk /cache/$(busybox basename $apk);
		if busybox [ -e /cache/$(busybox basename $apk) ]; then
		busybox cp -f /cache/$(busybox basename $apk) $apk  
		busybox rm /cache/$(busybox basename $apk);
		else
		echo ZipAligning $(busybox basename $apk) Failed  
		fi;
		else
		echo ZipAlign already completed on $apk  
		fi;
		done;
		sync
		for apk in /system/framework/*.apk ; do
		/sdcard/OpenRecovery/mod/zipalign/zipalign -c 4 $apk;
		ZIPCHECK=$?;
		if busybox [ $ZIPCHECK -eq 1 ]; then
		echo ZipAligning $(busybox basename $apk)  
		/sdcard/OpenRecovery/mod/zipalign/zipalign -f 4 $apk /cache/$(busybox basename $apk);
		if busybox [ -e /cache/$(busybox basename $apk) ]; then
		busybox cp -f /cache/$(busybox basename $apk) $apk  
		busybox rm /cache/$(busybox basename $apk);
		else
		echo ZipAligning $(busybox basename $apk) Failed  
		fi;
		else
		echo ZipAlign already completed on $apk  
		fi;
		done;
		sync
		echo ""
		echo "Automatic ZipAlign finished at $( date +"%m-%d-%Y %H:%M:%S" )" 
		echo ""
		echo "Androidiani OpenRecovery by 89luca89 and Azhad"
