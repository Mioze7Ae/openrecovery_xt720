#!/sbin/bash

SCRIPTS_DIR=/sdcard/OpenRecovery/apps

#recreate the file
echo "Recovery Apps" > "$MENU_FILE"

echo "Previous Page:menu:.." >> "$MENU_FILE"

if [ $1 -eq 1 ]
then
	echo "Update all::shell:/sdcard/OpenRecovery/mod/application_scripts/menu_apps_execute.sh updateall" >> "$MENU_FILE"
fi

CONT=0
END=0
LIMIT=$(($1*17))

if [ -d $SCRIPTS_DIR ]
then
	for SCRIPT in "$SCRIPTS_DIR/"*.apk; do
		CONT=$(($CONT+1))
		if [ $CONT -gt $(($LIMIT-17)) ]
		then
			if [ $CONT -gt $LIMIT ]
			then
				END=1
			else	
				BASE_SCRIPT=`basename "$SCRIPT"`
				#omit the default one
				if [ "$SCRIPT" != "$SCRIPTS_DIR/*.apk" ]
				then
					echo "$BASE_SCRIPT:shell:/sdcard/OpenRecovery/mod/application_scripts/menu_apps_execute.sh recovery $BASE_SCRIPT" >> "$MENU_FILE"
				fi
			fi
		fi
	done
fi

if [ $END -eq 1 ]
then
	echo "Next Page:scripted_menu:menuappsrecovery.menu:/sdcard/OpenRecovery/mod/application_scripts/menu_apps_recovery.sh $(($1+1))" >> "$MENU_FILE"
fi