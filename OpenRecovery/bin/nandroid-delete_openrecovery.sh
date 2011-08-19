#!/sbin/bash

# $1 DIRECTORY (absolute path)

#really want to?
BACKUP_NAME=`basename "$1"`

USER_ACTION=`imenu "Really delete ${BACKUP_NAME}?" No Yes`

if [ $USER_ACTION -eq 2 ]; then
	echo "Deleting ${BACKUP_NAME}..."
	rm -fr "$1"
else
	echo "Doing nothing."
fi
