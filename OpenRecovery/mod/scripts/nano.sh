#/sbin/sh

echo "install Nano Editor..."
			if [ ! -f "/system/xbin/nano" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/system/xbin/nano /system/xbin/
			chmod 755 /system/xbin/nano
			
			fi
			
			if [ ! -f "/system/etc/terminfo" ];
			then
				cp -f /sdcard/OpenRecovery/mod/system/etc/terminfo /system/etc/terminfo
				chmod 755 /system/etc/terminfo
				chmod 755 /system/etc/terminfo/l
				chmod 755 /system/etc/terminfo/u
				chmod 755 /system/etc/terminfo/l/linux
				chmod 755 /system/etc/terminfo/u/unknown
			
			fi
			
			echo "Nano Editor Installed."