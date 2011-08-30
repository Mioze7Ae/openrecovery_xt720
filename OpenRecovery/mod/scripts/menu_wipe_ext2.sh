#!/sbin/sh

echo "Azhad. Wipe Ext2" > "$MENU_FILE"
echo "Do You Want to Wipe the ext2 Partition?" > "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"
echo "Yes:shell:/sdcard/OpenRecovery/mod/scripts/wipe_ext2.sh" >> "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"
echo "No:menu:.." >> "$MENU_FILE"