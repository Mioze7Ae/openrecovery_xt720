#/sbin/sh

echo "install Bash..."
			if [ ! -f "/system/xbin/bash" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/bash /system/xbin/
			chmod 755 /system/xbin/bash
			fi

			echo "bash installed"