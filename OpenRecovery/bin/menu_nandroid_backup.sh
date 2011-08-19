#!/sbin/bash

echo "Nandroid Backup" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"
echo "Backup All:shell:nandroid-backup_openrecovery.sh --all" >> "$MENU_FILE"
echo "Backup Selected:shell:nandroid-backup_openrecovery.sh" >> "$MENU_FILE"
echo "Options:break:*" >> "$MENU_FILE"
echo "Reboot when finished:tag:nand_bkp_autoreboot" >> "$MENU_FILE"
echo "Compress backup:tag:nand_bkp_compress" >> "$MENU_FILE"
echo "Partitions:break:*" >> "$MENU_FILE"
echo "System:tag:nand_bkp_system" >> "$MENU_FILE"
echo "Data:tag:nand_bkp_data" >> "$MENU_FILE"
echo "Cache:tag:nand_bkp_cache" >> "$MENU_FILE"

#use /cust to see, as the nandroid is configured to mount /cust
if [ -d /cust ]; then
	echo "Cust:tag:nand_bkp_cust" >> "$MENU_FILE"
fi

echo "Cdrom:tag:nand_bkp_cdrom" >> "$MENU_FILE"

echo "Boot:tag:nand_bkp_boot" >> "$MENU_FILE"
echo "Baseband Software:tag:nand_bkp_bpsw" >> "$MENU_FILE"
echo "Linux Bootloader:tag:nand_bkp_lbl" >> "$MENU_FILE"
echo "Logo:tag:nand_bkp_logo" >> "$MENU_FILE"
echo "Device Tree:tag:nand_bkp_devtree" >> "$MENU_FILE"

#use /sddata to see, as the nandroid is configured to mount /sddata
if [ -d /sddata ]; then
	echo "SD Data:tag:nand_bkp_ext2" >> "$MENU_FILE"
fi
