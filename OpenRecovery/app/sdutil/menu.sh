#!/sbin/sh

echo "SD Card Utilities" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"
echo "Scan FAT partition for errors:shell:/app/sdutil/fsck_msdos.sh" >> "$MENU_FILE" 
if [ -b /dev/block/mmcblk0p2 ] ; then
    echo "Scan ext partition for errors:shell:/app/sdutil/fsck_ext.sh" >> "$MENU_FILE" 
fi

# if [ -f /system/etc/sdext/app2ext ]; then
# 	echo "[*] App2ext:label:*" >> "$MENU_FILE"
# 	echo "[ ] Link2SD:shell:/app/sdutil/link2sd.sh" >> "$MENU_FILE"
# 	echo "[ ] None:shell:/app/sdutil/none.sh" >> "$MENU_FILE"
# fi
# if [ -f /system/etc/sdext/link2sd ]; then
# 	echo "[ ] App2ext:shell:/app/sdutil/app2ext.sh" >> "$MENU_FILE"
# 	echo "[*] Link2SD:label:*" >> "$MENU_FILE"
# 	echo "[ ] None:shell:/app/sdutil/none.sh" >> "$MENU_FILE"
# fi
# if [ ! -f /system/etc/sdext/link2sd -a ! -f /system/etc/sdext/app2ext ]; then
#         echo "[ ] App2ext:shell:/app/sdutil/app2ext.sh" >> "$MENU_FILE" 
#         echo "[ ] Link2SD:shell:/app/sdutil/link2sd.sh" >> "$MENU_FILE"
# 	echo "[*] None:label:*" >> "$MENU_FILE"                
# fi


feat=$(tune2fs -l /dev/block/mmcblk0p2 | grep 'Filesystem features: ')
if [ ! -z "$feat" ] ; then
    ext=ext2
    if echo $feat | grep -q has_journal ; then
	ext=ext3
    fi
    if echo $feat | grep -q extent ; then
	ext=ext4
    fi
    case $ext in
	ext2)
	    echo "Convert ext2 to ext3:shell:/app/sdutil/convert3.sh" >> "$MENU_FILE" 
	    echo "Convert ext2 to ext4:shell:/app/sdutil/convert4.sh" >> "$MENU_FILE" 
	    ;;
	ext3)
	    echo "Convert ext3 to ext4:shell:/app/sdutil/convert4.sh" >> "$MENU_FILE" 
	    ;;
    esac
fi

echo "Save diagnostics to /sdcard/sdcard-info.txt:shell:/app/sdutil/diagnostics.sh" >> "$MENU_FILE"

echo "*:break:*" >> "$MENU_FILE"
echo "              Device Boot   Id System:label:*" >> "$MENU_FILE"
echo "*:break:*" >> "$MENU_FILE"
fdisk -l /dev/block/mmcblk0 | grep ^/dev/ | cut -c 1-28,63- | while read part
do
	echo "$part:label:*" >> "$MENU_FILE"
done
echo "*:break:*" >> "$MENU_FILE"
if [ ! -z "$ext" ] ; then
    echo "Ext partition appears to be $ext:label:*" >> "$MENU_FILE"
fi

