#!/sbin/sh

echo "Keyboard Layout Settings" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"

KBD_DIR=/sdcard/OpenRecovery/keychars

if [ -d "$KBD_DIR" ]; then
	for DIR in "$KBD_DIR"/*
 	do
 		BASE_DIR=`basename "$DIR"`
  	echo "$BASE_DIR:shell:change_keyboard_layout.sh $BASE_DIR" >> "$MENU_FILE"
	done
fi
