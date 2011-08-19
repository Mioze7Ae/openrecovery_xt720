#!/sbin/bash

SCRIPTS_DIR=/sdcard/OpenRecovery/scripts

#recreate the file
echo "Run Script" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"

if [ -d $SCRIPTS_DIR ]
then
	for SCRIPT in "$SCRIPTS_DIR/"*.sh; do
		#omit the default one
		if [ "$SCRIPT" != "$SCRIPTS_DIR/*.sh" ]
		then
			BASE_SCRIPT=`basename "$SCRIPT"`
			echo "$BASE_SCRIPT:shell:\"$SCRIPT\"" >> "$MENU_FILE"
		fi
	done
fi
