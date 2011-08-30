#/sbin/sh

echo "install Show/Hide ads scripts..."
			if [ ! -f "/system/xbin/hostsblock" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/hostsblock /system/xbin/
			chmod 755 /system/xbin/hostsblock
			
			fi

			if [ ! -f "/system/xbin/hostsshow" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/hostsshow /system/xbin/
			chmod 755 /system/xbin/hostsshow
			
			fi
			
				if [ ! -f "/system/xbin/blockads" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/blockads /system/xbin/
			chmod 755 /system/xbin/blockads
			
			fi
			
				if [ ! -f "/system/xbin/showads" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/showads /system/xbin/
			chmod 755 /system/xbin/showads
			
			fi
			echo "Show/hide scripts Installed."