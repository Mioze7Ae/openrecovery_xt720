#!/sbin/bash

SCRIPTS_DIR=/sdcard/OpenRecovery/scripts

if [ -d $SCRIPTS_DIR ]
then
	for SCRIPT in "$SCRIPTS_DIR/"*.sh; do
		#omit the default one
		if [ "$SCRIPT" != "$SCRIPTS_DIR/*.sh" ]
		then
			dos2unix -u "$SCRIPT"
		fi
	done
fi
