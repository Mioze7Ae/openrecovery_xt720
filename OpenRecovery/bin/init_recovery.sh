#!/sbin/bash

# arguments
# $1 the phone suffix
#
# SHOLS - Milestone (A853, XT702)
# STR - Milestone XT (XT720)
# STCU  - Sholes Tablet (XT701)

echo "Running the initialization script..."

if [ "$1" == "SHOLS" ]; then
	TABLET=0
else
	TABLET=1
fi

#run the initializers
#=======================================

INIT_DIR=/sdcard/OpenRecovery/init

if [ -d $INIT_DIR ]
then
	for INIT in "$INIT_DIR/"*.sh; do
		#omit if there is none
		if [ "$INIT" != "$INIT_DIR/*.sh" ]
		then
			BN_INIT=`basename "$INIT"`
			echo "Calling initializer $BN_INIT file."
			"$INIT"
		fi
	done
fi

#initialize the application menu
#=======================================

export APP_MENU_FILE="/menu/app.menu"

echo "Application Menu" > "$APP_MENU_FILE"
echo "Go Back:menu:.." >> "$APP_MENU_FILE"

if [ -d /sdcard/OpenRecovery/app/ ]
then

	mkdir /app
	cp -fR /sdcard/OpenRecovery/app/ /
	chmod -R 0755 /app
	
	APP_DIR=/app

	for APPINIT in "$APP_DIR/"*.sh; do
		#omit if there is none
		if [ "$APPINIT" != "$APP_DIR/*.sh" ]
		then
			BN_APPINIT=`basename "$APPINIT"`
			echo "Calling application initializer $BN_APPINIT file."
			"$APPINIT"
		fi
	done
fi

#initialize the Nandroid menu
#=======================================
export NAND_MENU_FILE="/menu/nand.menu"

echo "Nandroid" > "$NAND_MENU_FILE"
echo "Go Back:menu:.." >> "$NAND_MENU_FILE"
echo "Backup:scripted_menu:nandroid_backup.menu:menu_nandroid_backup.sh" >> "$NAND_MENU_FILE"
echo "Restore:scripted_menu:nandroid_restore.menu:menu_nandroid_restore.sh" >> "$NAND_MENU_FILE"
echo "Delete:scripted_menu:nandroid_delete.menu:menu_nandroid_delete.sh" >> "$NAND_MENU_FILE"

#initialize the Settings menu
#=======================================
export SETTINGS_MENU_FILE="/menu/settings.menu"

echo "Settings" > "$SETTINGS_MENU_FILE"
echo "Go Back:menu:.." >> "$SETTINGS_MENU_FILE"
echo "Bash:scripted_menu:bash.menu:menu_bash.sh" >> "$SETTINGS_MENU_FILE"
echo "Theme:scripted_menu:theme.menu:menu_theme.sh" >> "$SETTINGS_MENU_FILE"

if [ $TABLET -eq 0 ]; then
	echo "Keyboard Layout:scripted_menu:keyboard_layout.menu:menu_keyboard_layout.sh" >> "$SETTINGS_MENU_FILE"
fi

echo "Timezone:scripted_menu:timezone.menu:menu_timezone.sh" >> "$SETTINGS_MENU_FILE"

#initialize the main menu
#=======================================

echo "Creating main menu..."

MAIN_MENU_FILE=/menu/init.menu

echo "Main Menu" > "$MAIN_MENU_FILE"
echo "Reboot System:reboot:*" >> "$MAIN_MENU_FILE"
echo "Settings:menu:settings.menu" >> "$MAIN_MENU_FILE"
echo "USB Mass Storage Mode:shell:usb_mass_storage.sh" >> "$MAIN_MENU_FILE"

#only if not a tablet phone
if [ $TABLET -eq 0 ]; then
	echo "Console:console:*" >> "$MAIN_MENU_FILE"
fi	

echo "Nandroid:menu:nand.menu" >> "$MAIN_MENU_FILE"
echo "Application Menu:menu:app.menu" >> "$MAIN_MENU_FILE"

#only if not bootstrap
if [ ! -f /etc/bootstrap ]; then
	echo "Root Phone:shell:root.sh" >> "$MAIN_MENU_FILE"
fi

echo "Run Script:scripted_menu:runscript.menu:menu_scripts.sh" >> "$MAIN_MENU_FILE"
echo "Apply Update:scripted_menu:customupdate.menu:menu_updates.sh" >> "$MAIN_MENU_FILE"
echo "Wipe Dalvik Cache:shell:wipe_dalvik_cache.sh" >> "$MAIN_MENU_FILE"
echo "Wipe Data / Factory Reset:wipe_data:*" >> "$MAIN_MENU_FILE"
echo "Wipe Cache Partition:wipe_cache:*" >> "$MAIN_MENU_FILE"

echo "Done."
