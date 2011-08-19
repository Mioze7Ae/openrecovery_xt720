#!/sbin/bash

THEME_DIR=/sdcard/OpenRecovery/res.

echo "Theme Settings" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"

for THEME in "$THEME_DIR"*; do
	#omit the default one
	if [ $THEME != "$THEME_DIR" ]
	then
		BASE_THEME="$(basename $THEME)"
		THEME_NAME=`awk 'NR==1' $THEME/name`
		echo "$THEME_NAME:shell:set_theme.sh $BASE_THEME" >> "$MENU_FILE"
	fi
done
