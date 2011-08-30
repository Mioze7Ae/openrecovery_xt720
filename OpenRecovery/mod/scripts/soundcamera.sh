#/sbin/sh

echo "install Camerasound on/off scripts..."
			if [ ! -f "/system/xbin/soundon" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/soundon /system/xbin/
			chmod 755 /system/xbin/soundon
			
			fi

			if [ ! -f "/system/xbin/soundoff" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/soundoff /system/xbin/
			chmod 755 /system/xbin/soundoff
			
			fi
			
			echo "Soundon/soundoff scripts Installed."