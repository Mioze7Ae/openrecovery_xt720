#!/sbin/bash

echo "Nandroid Restore" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"

NAND_DIR_ADB=/sdcard/nandroid/adbrecovery
NAND_DIR_OPEN=/sdcard/nandroid/openrecovery

if [ -d "$NAND_DIR_ADB" ]; then	
	for DIR in "$NAND_DIR_ADB"/*
	do
		if [ "$DIR" != "$NAND_DIR_ADB/*" ]; then
		
			stat $DIR | grep directory
			STATUS=$?	
			
			if [ $STATUS -eq 0 ];	then
				BASE_DIR=`basename "$DIR"`
				echo "$BASE_DIR:scripted_menu:nandroid_restore_confirm.menu:menu_nandroid_restore_confirm.sh \"$DIR\"" >> "$MENU_FILE"
			fi
			
		fi
	done
fi

if [ -d "$NAND_DIR_OPEN" ]; then
	for DIR in "$NAND_DIR_OPEN"/*
	do
		if [ "$DIR" != "$NAND_DIR_OPEN/*" ]; then
		
			stat $DIR | grep directory
			STATUS=$?	
			
			if [ $STATUS -eq 0 ];	then
				BASE_DIR=`basename "$DIR"`
				echo "$BASE_DIR:scripted_menu:nandroid_restore_confirm.menu:menu_nandroid_restore_confirm.sh \"$DIR\"" >> "$MENU_FILE"
			fi
			
		fi
	done
fi
