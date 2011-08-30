#!/sbin/sh

    case $1 in
		sbin)
			echo "install busybox..."
			if [ ! -f "/system/sbin/busybox" ];
			then
				if [ ! -d "/system/sbin" ];
				then
				mkdir /system/sbin
				fi
			cp -f /sdcard/OpenRecovery/mod/sbin/busybox /system/sbin/
			chmod 755 /system/sbin/busybox
			/sbin/sh /system/sbin/busybox --install /system/sbin
			rm -f /system/sbin/su
			rm -f /system/sbin/reboot
			fi
			echo "done.";;
		xbin)
			echo "install busybox..."
			if [ ! -f "/system/xbin/busybox" ];
			then
				if [ ! -d "/system/xbin" ];
				then
				mkdir /system/xbin
				fi
			cp -f /sdcard/OpenRecovery/mod/sbin/busybox /system/xbin/
			chmod 755 /system/xbin/busybox
			/sbin/sh /system/xbin/busybox --install /system/xbin
			rm -f /system/xbin/su
			rm -f /system/xbin/reboot
			fi
			echo "done.";;
		data)
			echo "install busybox..."
			if [ ! -f "/data/busybox/busybox" ];
			then
				if [ ! -d "/data/busybox" ];
				then
				mkdir /data/busybox
				fi
			cp -f /sdcard/OpenRecovery/mod/sbin/busybox /data/busybox/
			chmod 755 /data/busybox/busybox
			/sbin/sh /data/busybox/busybox --install /data/busybox
			rm -f /data/busybox/su
			rm -f /data/busybox/reboot
			fi
			echo "done.";;
	esac