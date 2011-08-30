#!/sbin/sh

	case $1 in
		8gb)
			cp -f /sdcard/OpenRecovery/app2sd/bin/parted /bin/parted
			chmod 755 /bin/parted
			rm -fR /cache/*
			mkdir -p /cache/tmp
			cp -a /sdcard/OpenRecovery /sdcard/update.zip /cache/tmp
			umount -vf /sdcard
			umount -vf /sddata

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
			rm -fR /cache/*
			sleep 1;;
		16gb)
			cp -f /sdcard/OpenRecovery/app2sd/bin/parted /bin/parted
			chmod 755 /bin/parted
			rm -fR /cache/*
			mkdir -p /cache/tmp
			cp -a /sdcard/OpenRecovery /sdcard/update.zip /cache/tmp
			umount -vf /sdcard
			umount -vf /sddata

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
			rm -fR /cache/*
			sleep 1;;
		32gb)
			cp -f /sdcard/OpenRecovery/app2sd/bin/parted /bin/parted
			chmod 755 /bin/parted
			rm -fR /cache/*
			mkdir -p /cache/tmp
			cp -a /sdcard/OpenRecovery /sdcard/update.zip /cache/tmp
			umount -vf /sdcard
			umount -vf /sddata

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
			rm -fR /cache/*
			sleep 1;;
	esac
	
