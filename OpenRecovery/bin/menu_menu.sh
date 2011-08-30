#!/sbin/bash

SCRIPTS_DIR=/sdcard/OpenRecovery/$1
BASE_DIR=`basename "$SCRIPTS_DIR"`

#recreate the file
echo "$BASE_DIR" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"


	for SCRIPT in "$SCRIPTS_DIR/"*; do
		#omit the default one
   		BASE_SCRIPT=`basename "$SCRIPT"`
		if [ -d "$SCRIPT" ]
		then
			echo "$BASE_SCRIPT:scripted_menu:recursive.menu:menu_menu.sh '$1/$BASE_SCRIPT'" >> "$MENU_FILE"
		else 
			if [ ${BASE_SCRIPT:0:4} = "Menu" ]
			then
				echo "$BASE_SCRIPT:scripted_menu:recursive.menu:\"$SCRIPT\"" >> "$MENU_FILE"
			else
				echo "$BASE_SCRIPT:shell:/sbin/sh \"$SCRIPT\"" >> "$MENU_FILE"
			fi
		fi
	done

