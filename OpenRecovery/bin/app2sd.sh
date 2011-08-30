#!/sbin/sh

	case $1 in
		8gb)
			cp -f /sdcard/OpenRecovery/app2sd/bin/parted /bin/parted
			chmod 755 /bin/parted
			rm -fR /cache/*
			mkdir -p /cache/tmp
			cp -a /sdcard/OpenRecovery /sdcard/update.zip /cache/tmp
			umount /sdcard
			NUM=`/bin/parted -s /dev/block/mmcblk0 print | tail -2 | cut -d " " -f 2`
			if [ "$NUM" == "" ]; then
				NUM=0
			fi
			while [ $NUM != 0 ]; do
				/bin/parted -s /dev/block/mmcblk0 rm $NUM
				NUM=`expr $NUM - 1`
			done
			echo "create partition..."
			echo "Creating fat32-partition on card 0. This may take a while..."
			/bin/parted -s /dev/block/mmcblk0 mkpartfs primary fat32 0 7000
			echo "Creating ext2-partition on card 0. This may take a while..."
			/bin/parted -s /dev/block/mmcblk0 mkpartfs primary ext2 7000 7900
			echo "SDcard splitted (fat32+ext2)"
			mount /sdcard
			cp -a /cache/tmp/* /sdcard/
			sleep 1;;
		16gb)
			cp -f /sdcard/OpenRecovery/app2sd/bin/parted /bin/parted
			chmod 755 /bin/parted
			rm -fR /cache/*
			mkdir -p /cache/tmp
			cp -a /sdcard/OpenRecovery /sdcard/update.zip /cache/tmp
			umount /sdcard
			NUM=`/bin/parted -s /dev/block/mmcblk0 print | tail -2 | cut -d " " -f 2`
			if [ "$NUM" == "" ]; then
				NUM=0
			fi
			while [ $NUM != 0 ]; do
				/bin/parted -s /dev/block/mmcblk0 rm $NUM
				NUM=`expr $NUM - 1`
			done
			echo "create partition..."
			echo "Creating fat32-partition on card 0. This may take a while..."
			/bin/parted -s /dev/block/mmcblk0 mkpartfs primary fat32 0 15000
			echo "Creating ext2-partition on card 0. This may take a while..."
			/bin/parted -s /dev/block/mmcblk0 mkpartfs primary ext2 15000 15900
			echo "SDcard splitted (fat32+ext2)"
			mount /sdcard
			cp -a /cache/tmp/* /sdcard/
			sleep 1;;
		32gb)
			cp -f /sdcard/OpenRecovery/app2sd/bin/parted /bin/parted
			chmod 755 /bin/parted
			rm -fR /cache/*
			mkdir -p /cache/tmp
			cp -a /sdcard/OpenRecovery /sdcard/update.zip /cache/tmp
			umount /sdcard
			NUM=`/bin/parted -s /dev/block/mmcblk0 print | tail -2 | cut -d " " -f 2`
			if [ "$NUM" == "" ]; then
				NUM=0
			fi
			while [ $NUM != 0 ]; do
				/bin/parted -s /dev/block/mmcblk0 rm $NUM
				NUM=`expr $NUM - 1`
			done
			echo "create partition..."
			echo "Creating fat32-partition on card 0. This may take a while..."
			/bin/parted -s /dev/block/mmcblk0 mkpartfs primary fat32 0 31000
			echo "Creating ext2-partition on card 0. This may take a while..."
			/bin/parted -s /dev/block/mmcblk0 mkpartfs primary ext2 31000 31900
			echo "SDcard splitted (fat32+ext2)"
			mount /sdcard
			cp -a /cache/tmp/* /sdcard/
			sleep 1;;
		app2sd)
			echo "install app2sd..."
			cp -f /sdcard/OpenRecovery/app2sd/bin/ext2.ko /system/lib/modules/ext2.ko
			chmod 755 /system/lib/modules/ext2.ko
			insmod /system/lib/modules/ext2.ko
			mkdir /data/app2sd
			mount -t ext2 /dev/block/mmcblk0p2 /data/app2sd
			umount /data/app2sd
			mount -t ext2 /dev/block/mmcblk0p2 /data/app2sd
			sleep 1
			mkdir -p /sdcard/backup/app2sd/app >/dev/null 2>&1
			mkdir -p /sdcard/backup/app2sd/app-private >/dev/null 2>&1
			sleep 1
			mkdir /data/app2sd/app
			touch /data/app/empty
			cp -af /data/app/* /data/app2sd/app/
			cp -f /data/app/* /sdcard/backup/app2sd/app/
			rm /data/app/*
			mount -o bind /data/app2sd/app /data/app
			sleep 1
			mkdir /data/app2sd/app-private
			touch /data/app-private/empty
			cp -af /data/app-private/* /data/app2sd/app-private/
			cp -f /data/app-private/* /sdcard/backup/app2sd/app-private/
			rm /data/app-private/*
			mount -o bind /data/app2sd/app-private /data/app-private
			sleep 1
			if [ ! -f "/system/bin/mot_boot_mode.bin" ];
				then
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode /sdcard/OpenRecovery/backup/bin/mot_boot_mode
					cp -f /system/bin/mot_boot_mode /system/bin/mot_boot_mode.bin
				else
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode.bin /sdcard/OpenRecovery/backup/bin/mot_boot_mode
			fi
				cp -f /sdcard/OpenRecovery/app2sd/bin/mot_boot_mode /system/bin/mot_boot_mode
				chmod 755 /system/bin/mot_boot_mo*
				mkdir -p /system/bin/boot_script
				cp -f /sdcard/OpenRecovery/app2sd/bin/boot_script/51_app2sd.sh /system/bin/boot_script/51_app2sd.sh
				chmod -R 755 /system/bin/boot_script
				chown -R 0.2000 /system/bin/boot_script
			sleep 1;;
			app2sdsl)
			echo "install app2sd symlink edition..."
			cp -f /sdcard/OpenRecovery/app2sd/bin/ext2.ko /system/lib/modules/ext2.ko
			chmod 755 /system/lib/modules/ext2.ko
			insmod /system/lib/modules/ext2.ko
			mkdir /data/app2sd
			mount -t ext2 /dev/block/mmcblk0p2 /data/app2sd
			umount /data/app2sd
			mount -t ext2 /dev/block/mmcblk0p2 /data/app2sd
			sleep 1
			mkdir -p /sdcard/backup/app2sd/app >/dev/null 2>&1
			mkdir -p /sdcard/backup/app2sd/app-private >/dev/null 2>&1
			sleep 1
			mkdir /data/app2sd/app
			touch /data/app/empty
			cp -af /data/app/* /data/app2sd/app/
			cp -f /data/app/* /sdcard/backup/app2sd/app/
			rm -r /data/app
			ln -s /data/app2sd/app /data/app
			sleep 1
			mkdir /data/app2sd/app-private
			touch /data/app-private/empty
			cp -af /data/app-private/* /data/app2sd/app-private/
			cp -f /data/app-private/* /sdcard/backup/app2sd/app-private/
			rm -r /data/app-private
			ln -s /data/app2sd/app-private /data/app-private
			sleep 1
			if [ ! -f "/system/bin/mot_boot_mode.bin" ];
				then
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode /sdcard/OpenRecovery/backup/bin/mot_boot_mode
					cp -f /system/bin/mot_boot_mode /system/bin/mot_boot_mode.bin
				else
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode.bin /sdcard/OpenRecovery/backup/bin/mot_boot_mode
			fi
				cp -f /sdcard/OpenRecovery/app2sd/bin/mot_boot_mode /system/bin/mot_boot_mode
				chmod 755 /system/bin/mot_boot_mo*
				mkdir -p /system/bin/boot_script
				cp -f /sdcard/OpenRecovery/app2sd/bin/boot_script/51_app2sd_sl.sh /system/bin/boot_script/51_app2sd.sh
				chmod -R 755 /system/bin/boot_script
				chown -R 0.2000 /system/bin/boot_script
			sleep 1;;
		hackonly)
			echo "install app2sd hack..."
			if [ ! -f "/system/bin/mot_boot_mode.bin" ];
				then
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode /sdcard/OpenRecovery/backup/bin/mot_boot_mode
					cp -f /system/bin/mot_boot_mode /system/bin/mot_boot_mode.bin
				else
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode.bin /sdcard/OpenRecovery/backup/bin/mot_boot_mode
			fi
				cp -f /sdcard/OpenRecovery/app2sd/bin/mot_boot_mode /system/bin/mot_boot_mode
				chmod 755 /system/bin/mot_boot_mo*
				mkdir -p /system/bin/boot_script
				cp -f /sdcard/OpenRecovery/app2sd/bin/boot_script/51_app2sd.sh /system/bin/boot_script/51_app2sd.sh
				chmod -R 755 /system/bin/boot_script
				chown -R 0.2000 /system/bin/boot_script
			sleep 1;;
		hackonlysl)
			echo "install app2sd symlink hack..."
			if [ ! -f "/system/bin/mot_boot_mode.bin" ];
				then
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode /sdcard/OpenRecovery/backup/bin/mot_boot_mode
					cp -f /system/bin/mot_boot_mode /system/bin/mot_boot_mode.bin
				else
					mkdir -p /sdcard/OpenRecovery/backup/bin
					cp -f /system/bin/mot_boot_mode.bin /sdcard/OpenRecovery/backup/bin/mot_boot_mode
			fi
				cp -f /sdcard/OpenRecovery/app2sd/bin/mot_boot_mode /system/bin/mot_boot_mode
				chmod 755 /system/bin/mot_boot_mo*
				mkdir -p /system/bin/boot_script
				cp -f /sdcard/OpenRecovery/app2sd/bin/boot_script/51_app2sd_sl.sh /system/bin/boot_script/51_app2sd.sh
				chmod -R 755 /system/bin/boot_script
				chown -R 0.2000 /system/bin/boot_script
			sleep 1;;
	esac
	
