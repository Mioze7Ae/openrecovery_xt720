#/sbin/sh

echo "install Mountro/Mountrw scripts..."
			if [ ! -f "/system/xbin/mountro" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/mountro /system/xbin/
			chmod 755 /system/xbin/mountro
			
			fi

			if [ ! -f "/system/xbin/mountrw" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/mountrw /system/xbin/
			chmod 755 /system/xbin/mountrw
			
			fi
			
			echo "mountro/mountrw scripts Installed."