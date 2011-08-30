#!/sbin/bash

SCRIPTS_DIR='cat /sdcarrd/OpenRecovery/mod/fmanager/folder'
COMMAND='cat /sdcarrd/OpenRecovery/mod/fmanager/command'

#recreate the file
echo "$SCRIPTS_DIR" > "$MENU_FILE"

if [ $PAGE -ne 1 ]
then
	echo "Previous Page:menu:.." >> "$MENU_FILE"
fi
if [ ! $SCRIPTS_DIR = / ]
then
	echo "Up Folder:menu:.." >> "$MENU_FILE"
fi
echo "Menu Commands:menu:.." >> "$MENU_FILE"

CONT=0
END=0
LIMIT=$(($PAGE*15))

if [ -d $SCRIPTS_DIR ]
then
	for SCRIPT in "$SCRIPTS_DIR/"; do
		CONT=$(($CONT+1))
		if [ $CONT -gt $(($LIMIT-15)) ]
		then
			if [ $CONT -gt $LIMIT ]
			then
				END=1
			else	
				BASE_SCRIPT=`basename "$SCRIPT"`
				#omit the default one
				if [ -d $SCRIPT ]
				then
					if [ COMMAND = "select" ]
					then
						echo "$BASE_SCRIPT:scripted_menu:recursive.menu:/sdcard/OpenRecovery/mod/fmanager/menu_fmanager.sh $PAGE select $BASE_SCRIPT" >> "$MENU_FILE"
					else
						echo "$BASE_SCRIPT:scripted_menu:recursive.menu:/sdcard/OpenRecovery/mod/fmanager/menu_fmanager.sh $PAGE cd $SCRIPT" >> "$MENU_FILE"
           fi
				else
					if [ COMMAND = "select" ]
						echo "$BASE_SCRIPT:scripted_menu:recursive.menu:/sdcard/OpenRecovery/mod/fmanager/menu_fmanager.sh $PAGE select $BASE_SCRIPT" >> "$MENU_FILE"
					else
						echo "$BASE_SCRIPT:scripted_menu:recursive.menu:/sdcard/OpenRecovery/mod/fmanager/menu_execute.sh file $BASE_SCRIPT" >> "$MENU_FILE"
           fi
         fi
			fi
		fi
	done
fi

if [ $END -eq 1 ]
then
	echo "Next Page:scripted_menu:menuappssystem.menu:/sdcard/OpenRecovery/mod/application_scripts/menu_apps_system.sh $(($PAGE+1))" >> "$MENU_FILE"
fi