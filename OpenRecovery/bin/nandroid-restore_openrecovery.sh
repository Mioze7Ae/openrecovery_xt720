#!/sbin/bash

# $1 DIRECTORY (absolute path)
# $2 --all (optional)

RESTOREPATH=$1

REBOOT=0
NOTHING=1

REST_BOOT=0
REST_BPSW=0
REST_LBL=0
REST_LOGO=0
REST_DEVTREE=0

REST_SYSTEM=0
REST_DATA=0
REST_CACHE=0
REST_CDROM=0
REST_CUST=0

REST_EXT2=0

TAGPREFIX="/tags/."

#amount of space remaining
FREEBLOCKS="`df -k /sdcard| grep sdcard | awk '{ print $4 }'`"
#error
ERROR=""

echo "+----------------------------------------------+"
echo "+                                              +"
echo "+        Open Recovery Nandroid Restore        +"
echo "+                                              +"
echo "+----------------------------------------------+"
sleep 2

#===============================================================================
# Parse the arguments
#===============================================================================

if [ -f "$TAGPREFIX"nand_rest_autoreboot ]; then
	REBOOT=1
fi

if [ "$2" == "--all" ]; then
	REST_BOOT=1
	REST_BPSW=1
	REST_LBL=1
	REST_LOGO=1
	REST_DEVTREE=1
	REST_SYSTEM=1
	REST_DATA=1
	REST_CACHE=1
	REST_CDROM=1
	REST_CUST=1
	REST_EXT2=1
	NOTHING=0
else

	if [ -f "$TAGPREFIX"nand_rest_system ]; then
		REST_SYSTEM=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_data ]; then
		REST_DATA=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_boot ]; then
		REST_BOOT=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_cache ]; then
		REST_CACHE=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_bpsw ]; then
		REST_BPSW=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_lbl ]; then
		REST_LBL=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_logo ]; then
		REST_LOGO=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_devtree ]; then
		REST_DEVTREE=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_cdrom ]; then
		REST_CDROM=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_cust ]; then
		REST_CUST=1
		NOTHING=0
	fi
	
	if [ -f "$TAGPREFIX"nand_rest_ext2 ]; then
		REST_EXT2=1
		NOTHING=0
	fi
fi

if [ $NOTHING -eq 1 ]; then
	echo "E:There is nothing to restore."
	exit 1
fi

#===============================================================================
# Prepare the restoration
#===============================================================================

#check availbility of the utilities
erase_image=`which erase_image`
if [ "$erase_image" == "" ]; then
	erase_image=`which erase_image-or`
	if [ "$erase_image" == "" ]; then
		echo "E:erase_image or erase_image-or not found in path."
		exit 1
	fi
fi

flash_image=`which flash_image`
if [ "$flash_image" == "" ]; then
	flash_image=`which flash_image-or`
	if [ "$flash_image" == "" ]; then
		echo "E:flash_image or flash_image-or not found in path."
		exit 1
	fi
fi

unyaffs=`which unyaffs`
if [ "$unyaffs" == "" ]; then
	unyaffs=`which unyaffs-or`
	if [ "$unyaffs" == "" ]; then
		echo "E:unyaffs or unyaffs-or not found in path."
		exit 1
	fi
fi


#check battery
if [ "$COMPRESS" == 1 ]; then
	ENERGY=`cat /sys/class/power_supply/battery/capacity`
	if [ "`cat /sys/class/power_supply/battery/status`" == "Charging" ]; then
		ENERGY=100
	fi
	if [ ! $ENERGY -ge 30 ]; then
		echo "E:Not enough battery power to perform compression."      
		exit 1
	fi
fi

#===============================================================================
# Check compression
#===============================================================================

COMPRESSED=0

CWD=$PWD
cd "$RESTOREPATH"

if [ `ls *.bz2 2>/dev/null|wc -l` -ge 1 ]; then
	echo "This backup is compressed."
	COMPRESSED=1
	
	if [ $FREEBLOCKS -le 262144 ]; then
		echo "E:Not enough free space available on sdcard for decompression operation (need 256 MiB)."
		cd $CWD
		exit 1
	else
		echo "There is at least 256 MiB on the sdcard."
	fi
fi

#===============================================================================
# Check the format (either nandroid.md5 exists or not)
# If it doesn't exist, think of it to be the Open Recovery Backup type
# and fail later when attempting to restore the partition.
#
# If old format, verify checksums now
# If mixed format, give priority to the old format
#===============================================================================

if [ ! -f nandroid.md5 ]; then
	OPEN_RCVR_BKP=1
else
	OPEN_RCVR_BKP=0	
	echo "NOTE: This backup is in old format."
	echo "Verifying MD5..."
	
	md5sum -c nandroid.md5
	if [ $? -eq 1 ]; then
		echo "E:Failed verifying checksums."
		exit 1
	fi	
fi

#===============================================================================
# Restore the non-filesystem partitions
#===============================================================================

for image in boot bpsw lbl logo devtree; do
	if [ ! -f $image.img* ]; then
		echo "${image}: Not backed up."
		continue
	fi
	
	case $image in
		boot)
			if [ $REST_BOOT -eq 0 ]; then
				echo "boot: Skipping."
				continue
			fi
			;;
			
		bpsw)
			if [ $REST_BPSW -eq 0 ]; then
				echo "bpsw: Skipping."
				continue
			fi
			;;
			
		lbl)
			if [ $REST_LBL -eq 0 ]; then
				echo "lbl: Skipping."
				continue
			fi
			;;
			
		logo)
			if [ $REST_LOGO -eq 0 ]; then
				echo "logo: Skipping."
				continue
			fi
			;;
			
		devtree)
			if [ $REST_DEVTREE -eq 0 ]; then
				echo "devtree: Skipping."
				continue
			fi
			;;
	esac
	
	if [ $OPEN_RCVR_BKP -eq 1 ]; then  
	
		if [ $COMPRESSED -eq 1 ]; then
			echo -n "${image}: Decompressing..."
			bunzip2 -c $image.img.bz2 > $image.img
			echo "done"
		fi
		
		if [ ! -f $image.md5 ]; then
			echo "${image}: MD5 checksum file missing, skipping."
			
			if [ $COMPRESSED -eq 1 ]; then
				#delete the uncompressed part
				rm $image.img
			fi
			
			ERROR="${ERROR}${image}: MD5 checksum file missing.\n"		
			continue
		fi
		
		echo -n "${image}: Verifying MD5..."  	
		md5sum -c $image.md5 > /dev/null
		
		if [ $? -eq 1 ]; then
			echo "failed"
			echo "${image}: MD5 checksum mismatch, skipping."
			
			if [ $COMPRESSED -eq 1 ]; then
				#delete the uncompressed part
				rm $image.img
			fi
			
			ERROR="${ERROR}${image}: MD5 checksum mismatch.\n"
			continue
		fi
		
		echo "done"
	fi
	
	echo -n "${image}: Restoring..."
	$flash_image $image $image.img > /dev/null 2> /dev/null
	echo "done"
	
	if [ $COMPRESSED -eq 1 ]; then
		#delete the uncompressed part
		rm $image.img
	fi
	
done

#===============================================================================
# Restore the yaffs2 filesystem partitions
#===============================================================================

for image in system data cache cust cdrom; do
	if [ ! -f $image.img* ]; then
		echo "${image}: Not backed up."
		continue
	fi
	
	case $image in
		system)
			if [ $REST_SYSTEM -eq 0 ]; then
				echo "system: Skipping."
				continue
			fi
		  ;;
	    
		data)
			if [ $REST_DATA -eq 0 ]; then
				echo "data: Skipping."
				continue
			fi
			;;
	    
		cache)
			if [ $REST_CACHE -eq 0 ]; then
				echo "cache: Skipping."
				continue
			fi
			;;
	
		cust)
			if [ $REST_CUST -eq 0 ]; then
				echo "cust: Skipping ."
				continue
			fi
			;;
	
		cdrom)
			if [ $REST_CDROM -eq 0 ]; then
				echo "cdrom: Skipping."
				continue
			fi
			;;
	esac
	
	umount /$image 2> /dev/null
	mount /$image 2> /dev/null
	
	if [ $? -ne 0 ]; then
		echo "E:Cannot mount properly /$image."
		echo "${image}: Cannot restore."
		ERROR="${ERROR}${image}: Failed to mount.\n"
		continue
	fi
	
	if [ $OPEN_RCVR_BKP -eq 1 ]; then  
	
		if [ $COMPRESSED -eq 1 ]; then
			echo -n "${image}: Decompressing..."
			bunzip2 -c $image.img.bz2 > $image.img
			echo "done"
		fi
		
		if [ ! -f $image.md5 ]; then
			echo "${image}: MD5 checksum file missing, skipping."
			
			if [ $COMPRESSED -eq 1 ]; then
				#delete the uncompressed part
				rm $image.img
			fi
			
			ERROR="${ERROR}${image}: MD5 checksum file missing.\n"		
			continue
		fi
		
		echo -n "${image}: Verifying MD5..."  	
		md5sum -c $image.md5 > /dev/null
		
		if [ $? -eq 1 ]; then
			echo "failed"
			echo "${image}: MD5 checksum mismatch, skipping."
			
			if [ $COMPRESSED -eq 1 ]; then
				#delete the uncompressed part
				rm $image.img
			fi
			
			ERROR="${ERROR}${image}: MD5 checksum mismatch.\n"
			continue
		fi
		
		echo "done"
	fi
	
	if [ "$image" == "system" ]; then
		if [ -d /system/persistent ]; then
			echo -n "${image}: Backing up persistent data..."
			
			mkdir /system_persistent > /dev/null
			cp -a /system/persistent /system_persistent > /dev/null
			
			#check .sh tag
			if [ -f /system/persistent/.persistent_sh ]; then
				cp -a /system/bin/sh /system_persistent/sh > /dev/null
			fi
			
			echo "done"
		fi
	fi
	
	umount /$image 2> /dev/null
	echo -n "${image}: Erasing..."
	
	if [ "$image" == "data" ]; then
		my_image="userdata"
	else
		my_image=$image	
	fi
		
	$erase_image $my_image > /dev/null 2> /dev/null
	echo "done"
	mount /$image
	echo -n "${image}: Restoring..."
	$unyaffs $image.img /$image	> /dev/null 2> /dev/null
	echo "done"
	
	if [ "$image" == "system" ]; then
		if [ -d /system_persistent ]; then
			echo -n "${image}: Restoring persistent data..."
			
			if [ -d /system/persistent ]; then
				rm -r /system/persistent > /dev/null
			fi
			
			cp -a /system_persistent/persistent /system > /dev/null
			
			#check .sh tag (can be checked in the copied one)
			if [ -f /system_persistent/persistent/.persistent_sh ]; then
				rm /system/bin/sh > /dev/null
				cp -a /system_persistent/sh /system/bin/sh  > /dev/null
			fi
			
			rm -r /system_persistent > /dev/null
			
			echo "done"
		fi
	fi
	
	if [ $COMPRESSED -eq 1 ]; then
		#delete the uncompressed part
		rm $image.img
	fi
	
done

#===============================================================================
# EXT2
#===============================================================================

if [ ! -f ext2.tar ]; then
	echo "ext2: Not backed up."
else 
	if [ $REST_EXT2 -eq 0 ]; then
		echo "ext2: Skipping."
	elif [ ! -d /sddata ]; then
		echo "E: ext2 partition does not exist"
		echo "ext2: Cannot restore."
		ERROR="${ERROR}ext2: Attempted to restore non-existing partition.\n"
	else	
		if [ ! -f ext2.md5 ]; then
			echo "Partition ext2 checksum file missing, skipping."		
			
			if [ $COMPRESSED -eq 1 ]; then
				#delete the uncompressed part
				rm ext2.tar
			fi
			
			ERROR="${ERROR}ext2: MD5 checksum file missing.\n"
			
		else
					
			echo -n "ext2: Verifying MD5..."
			md5sum -c ext2.md5 > /dev/null
			
			if [ $? -eq 1 ]; then
				echo "failed"
				echo "Partition ext2 checksum mismatch, skipping."
				
				if [ $COMPRESSED -eq 1 ]; then
					#delete the uncompressed part
					rm ext2.tar
				fi
				
				ERROR="${ERROR}ext2: MD5 checksum mismatch.\n"
				
			else
				echo "done"
				echo -n "ext2: Erasing..."
				umount /sddata 2> /dev/null
				mkfs.ext2 -c /dev/block/mmcblk0p2 > /dev/null
				echo "done"
				
				echo -n "ext2: Restoring..."
				mount /sddata
				CW2=$PWD
				cd /sddata
				tar -xvf $RESTOREPATH/ext2.tar ./ > /dev/null
				cd "$CW2"
				echo "done"
				
				if [ $COMPRESSED -eq 1 ]; then
					#delete the uncompressed part
					rm ext2.tar
				fi
			fi
		fi
	fi
fi

#===============================================================================
# Exit
#===============================================================================

cd "$CWD"
if [ "$ERROR" != "" ]; then
	echo "+----------------------------------------------+"
	echo "+                                              +"
	echo "+           ERROR IN NANDROID RESTORE          +"
	echo "+                                              +"
	echo "+----------------------------------------------+"
	
	printf "$ERROR"
	
else
	echo "Restoring finished successfully."
	
	if [ $REBOOT -eq 1 ]; then
		reboot
	fi
	
fi

