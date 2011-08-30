#!/sbin/bash

SCRIPTS_DIR=/system/app

#recreate the file
echo "System Apps" > "$MENU_FILE"

echo "Previous Page:menu:.." >> "$MENU_FILE"

CONT=0
END=0
LIMIT=$(($1*17))

#if [ $1 -ne 1 ]
#then
#	echo "Previous Page:scripted_menu:menuappssystem.menu:/sdcard/OpenRecovery/mod/application_scripts/menu_apps_system.sh $(($1-1))" >> "$MENU_FILE"
#fi

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
					echo "$BASE_SCRIPT:shell:/sdcard/OpenRecovery/mod/application_scripts/menu_apps_execute.sh system $BASE_SCRIPT" >> "$MENU_FILE"
				fi
			fi
		fi
	done
fi

if [ $END -eq 1 ]
then
	echo "Next Page:scripted_menu:menuappssystem.menu:/sdcard/OpenRecovery/mod/application_scripts/menu_apps_system.sh $(($1+1))" >> "$MENU_FILE"
fi