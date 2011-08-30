#/sbin/sh

echo "install Switch Bootanimation script..."
			if [ ! -f "/system/xbin/switchba" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/switchba /system/xbin/
			chmod 755 /system/xbin/switchba
			fi

			echo "switchba script installed"