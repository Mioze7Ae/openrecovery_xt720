#/sbin/sh

echo "install Movecache script..."
			if [ ! -f "/system/xbin/movecache" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/movecache /system/xbin/
			chmod 755 /system/xbin/movecache
			
			fi
			
			echo "movechace script Installed."