#/sbin/sh

echo "install Zipalign all system apk scripts..."
			if [ ! -f "/system/xbin/zipalign" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/zipalign /system/xbin/
			chmod 755 /system/xbin/zipalign
			fi
			
			if [ ! -f "/system/xbin/zipalign_apks" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/zipalign_apks /system/xbin/
			chmod 755 /system/xbin/zipalign_apks
			fi
			

			echo "zipalign_apks installed"