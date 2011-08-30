#!/sbin/sh

dirs="
/cache/dalvik-cache
/cache/dc
/data/app
/data/app-private
/data/dalvik-cache
/data/sdext2
/sddata/app
/sddata/app-private
/sddata/dalvik-cache
/sddata/link2sd
"

if ! grep -q " /sdcard " /proc/mounts ; then
    echo ERROR: /sdcard is not mounted
    exit
fi

exec >/sdcard/sdcard-info.txt 2>&1
date
cat /sdcard/OpenRecovery/version.txt

echo
echo Mounted filesystems
echo -------------------
cat /proc/mounts

echo
echo Directory configuration
echo -----------------------
for x in $dirs ; do
    ls -ld $x
done
echo
for x in $dirs ; do
    if [ -d $x ] ; then
	echo Directory $x contains $(ls -1 $x | wc -l) files
    fi
done
echo
echo SD card partition table:
echo ------------------------
fdisk -l /dev/block/mmcblk0
echo
echo EXT partition properties:
echo -------------------------
tune2fs -l /dev/block/mmcblk0p2
