#!/sbin/bash

UPDATES_DIR=/sdcard/OpenRecovery/updates

#recreate the file
echo "Apply Update" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"

if [ -d $UPDATES_DIR ]
then
	for UPDATE in "$UPDATES_DIR/"*.zip; do
		#omit the default one
		if [ "$UPDATE" != "$UPDATES_DIR/*.zip" ]
		then
			BASE_UPDATE=`basename "$UPDATE"`
			echo "$BASE_UPDATE:update:SDCARD:OpenRecovery/updates/$BASE_UPDATE" >> "$MENU_FILE"
		fi
	done
fi
