#!/sbin/sh

	case $1 in
		system)
			RES=`imenu "Command to Execute" "Copy to Recovery" "Copy to Internal" "Delete" "Cancel"`
			if [ $RES -eq 1 ]; then
				echo "Copying "$2" to Recovery..."
				cp -f /system/app/$2 /sdcard/OpenRecovery/apps/$2
				USER_ACTION=`imenu "Copy also application data for $2?" "No" "Yes" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					BASE_SCRIPT=$2
					LEN=${#BASE_SCRIPT}
					if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
					then
						echo "Copying "$BASE_SCRIPT" data to Recovery..."
						rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))}
						cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))} /sdcard/OpenRecovery/apps/data/
					else
						if [ ${BASE_SCRIPT:(-6):1} = - ]
						then
							LEN=${#BASE_SCRIPT}
							if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
							then
								echo "Copying "$BASE_SCRIPT" data to Recovery..."	
								rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))}
								cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))} /sdcard/OpenRecovery/apps/data/
							else
								echo "Couldn't find data for "$2""
							fi
						fi
					fi
				fi
			fi	
			if [ $RES -eq 2 ]; then
				echo "Copying "$2"..."	
				cp -f /system/app/$2 /data/app/$2
			fi
			if [ $RES -eq 3 ]; then
				USER_ACTION=`imenu "Really delete $2?" "No" "Yes" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					echo "Deleting "$2" from System Memory..."
					rm -fr /system/app/$2
					USER_ACTION=`imenu "Delete also application data for $2?" "No" "Yes" "" ""`
					if [ $USER_ACTION -eq 2 ]; then
						BASE_SCRIPT=$2
						LEN=${#BASE_SCRIPT}
						if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
						then
							echo "Deleting "$BASE_SCRIPT" data..."	
							rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))}
						else
							if [ ${BASE_SCRIPT:(-6):1} = - ]
							then
								LEN=${#BASE_SCRIPT}
								if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
								then
									echo "Deleting "$BASE_SCRIPT" data..."	
									rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))}
								else
									echo "Couldn't find data for "$2""
								fi
							fi
						fi
					fi
				else
					echo "Doing nothing."
				fi
			fi
			if [ $RES -eq 4 ]; then
				echo "Doing nothing."
			fi
			sleep 1;;
		internal)
			RES=`imenu "Command to Execute" "Copy to Recovery" "Copy to System" "Delete" "Cancel"`
			if [ $RES -eq 1 ]; then
				echo "Copying "$2" to Recovery..."
				cp -f /data/app/$2 /sdcard/OpenRecovery/apps/$2
				USER_ACTION=`imenu "Copy also application data for $2?" "No" "Yes" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					BASE_SCRIPT=$2
					LEN=${#BASE_SCRIPT}
					if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
					then
						echo "Copying "$BASE_SCRIPT" data to Recovery..."
						rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))}
						cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))} /sdcard/OpenRecovery/apps/data/
					else
						if [ ${BASE_SCRIPT:(-6):1} = - ]
						then
							LEN=${#BASE_SCRIPT}
							if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
							then
								echo "Copying "$BASE_SCRIPT" data to Recovery..."
								rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))}
								cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))} /sdcard/OpenRecovery/apps/data/
							else
								echo "Couldn't find data for "$2""
							fi
						fi
					fi
				fi
			fi
			if [ $RES -eq 2 ]; then
				echo "Copying "$2" to System Memory..."
				cp -f /data/app/$2 /system/app/$2
			fi
			if [ $RES -eq 3 ]; then
				USER_ACTION=`imenu "Really delete $2?" "No" "Yes" "" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					echo "Deleting "$2" from Internal Memory..."
					rm -fr /data/app/$2
					USER_ACTION=`imenu "Delete also application data for $2?" "No" "Yes" "" "" ""`
					if [ $USER_ACTION -eq 2 ]; then
						BASE_SCRIPT=$2
						LEN=${#BASE_SCRIPT}
						if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
						then
							echo "Deleting "$BASE_SCRIPT" data..."	
							rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))}
						else
							if [ ${BASE_SCRIPT:(-6):1} = - ]
							then
								LEN=${#BASE_SCRIPT}
								if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
								then
									echo "Deleting "$BASE_SCRIPT" data..."	
									rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))}
								else
									echo "Couldn't find data for "$2""
								fi
							fi
						fi
					fi
				else
					echo "Doing nothing."
				fi		
			fi
			if [ $RES -eq 4 ]; then
				echo "Doing nothing."
			fi
			sleep 1;;
		recovery)
			RES=`imenu "Command to Execute" "Update Recovery Copy" "Copy to Internal" "Copy to System" "Delete" "Cancel"`
			if [ $RES -eq 1 ]; then
				echo "Updating "$2"..."
				cp -f /system/app/$2 /sdcard/OpenRecovery/apps/$2
				cp -f /data/app/$2 /sdcard/OpenRecovery/apps/$2
				USER_ACTION=`imenu "Update also application data for $2?" "No" "Yes" "" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					BASE_SCRIPT=$2
					LEN=${#BASE_SCRIPT}
					if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
					then
						echo "Updating "$BASE_SCRIPT" data..."	
						rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))}
						cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))} /sdcard/OpenRecovery/apps/data/
					else
						if [ ${BASE_SCRIPT:(-6):1} = - ]
						then
							LEN=${#BASE_SCRIPT}
							if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
							then
								echo "Updating "$BASE_SCRIPT" data..."	
								rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))}
								cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))} /sdcard/OpenRecovery/apps/data/
							else
								echo "Couldn't find data for "$2""
							fi
						fi
					fi
				fi
			fi
			if [ $RES -eq 2 ]; then
				echo "Copying "$2" to Internal Memory..."	
				cp -f /sdcard/OpenRecovery/apps/$2 /data/app/$2
				USER_ACTION=`imenu "Copy also application data for $2?" "No" "Yes" "" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					BASE_SCRIPT=$2
					LEN=${#BASE_SCRIPT}
					if [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
					then
						echo "Copying "$BASE_SCRIPT" to Internal Memory..."	
						rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))}
						cp -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))} /data/data/
					else
						if [ ${BASE_SCRIPT:(-6):1} = - ]
						then
							LEN=${#BASE_SCRIPT}
							if [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
							then
								echo "Copying "$BASE_SCRIPT" to Internal Memory..."	
								rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))}
								cp -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))} /data/data/
							else
								echo "Couldn't find data for "$2""
							fi
						fi
					fi
				fi
			fi
			if [ $RES -eq 3 ]; then
				echo "Copying "$2" to System Memory..."		
				cp -f /sdcard/OpenRecovery/apps/$2 /system/app/$2
				USER_ACTION=`imenu "Copy also application data for $2?" "No" "Yes" "" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					BASE_SCRIPT=$2
					LEN=${#BASE_SCRIPT}
					if [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
					then
						echo "Copying "$BASE_SCRIPT" data..."	
						rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))}
						cp -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))} /data/data/
					else
						if [ ${BASE_SCRIPT:(-6):1} = - ]
						then
							LEN=${#BASE_SCRIPT}
							if [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
							then
								echo "Copying "$BASE_SCRIPT" data..."
								rm -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))}
								cp -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))} /data/data/
							else
								echo "Couldn't find data for "$2""
							fi
						fi
					fi
				fi
			fi
			if [ $RES -eq 4 ]; then
				USER_ACTION=`imenu "Really delete $2?" "No" "Yes" "" "" ""`
				if [ $USER_ACTION -eq 2 ]; then
					echo "Deleting "$2" from Recovery..."
					rm -fr /sdcard/OpenRecovery/apps/$2
					USER_ACTION=`imenu "Delete also application data for $2?" "No" "Yes" "" "" ""`
					if [ $USER_ACTION -eq 2 ]; then
						BASE_SCRIPT=$2
						LEN=${#BASE_SCRIPT}
						if [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
						then
							echo "Deleting "$BASE_SCRIPT" data from Recovery..."	
							rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))}
						else
							if [ ${BASE_SCRIPT:(-6):1} = - ]
							then
								LEN=${#BASE_SCRIPT}
								if [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
								then
									echo "Deleting "$BASE_SCRIPT" data from Recovery..."	
									rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))}
								else
									echo "Couldn't find data for "$2""
								fi
							fi
						fi
					fi
				else
					echo "Doing nothing."
				fi
			fi	
			if [ $RES -eq 5 ]; then
				echo "Doing nothing."
			fi
			sleep 1;;	
		updateall)
			USER_ACTION=`imenu "Update also application data for $2?" "No" "Yes" "Cancel" "" ""`
			if [ $USER_ACTION -eq 1 ]; then
				for SCRIPT in "/sdcard/OpenRecovery/apps/"*.apk; do
					BASE_SCRIPT=`basename "$SCRIPT"`
					if [ /system/app/$BASE_SCRIPT -nt /sdcard/OpenRecovery/apps/$BASE_SCRIPT ]
					then
						echo "Updating "$BASE_SCRIPT"..."	
						cp -f /system/app/$BASE_SCRIPT /sdcard/OpenRecovery/apps/$BASE_SCRIPT
					fi	
					if [ /data/app/$BASE_SCRIPT -nt /sdcard/OpenRecovery/apps/$BASE_SCRIPT ]
					then
						echo "Updating "$BASE_SCRIPT"..."	
						cp -f /data/app/$BASE_SCRIPT /sdcard/OpenRecovery/apps/$BASE_SCRIPT
					fi	
				done
			fi
			if [ $USER_ACTION -eq 2 ]; then
				for SCRIPT in "/sdcard/OpenRecovery/apps/"*.apk; do
					DATA_PRESENT=0
					BASE_SCRIPT=`basename "$SCRIPT"`
					if [ /system/app/$BASE_SCRIPT -nt /sdcard/OpenRecovery/apps/$BASE_SCRIPT ]
					then
						echo "Updating "$BASE_SCRIPT"..."	
						cp -f /system/app/$BASE_SCRIPT /sdcard/OpenRecovery/apps/$BASE_SCRIPT
					fi	
					if [ /data/app/$BASE_SCRIPT -nt /sdcard/OpenRecovery/apps/$BASE_SCRIPT ]
					then
						echo "Updating "$BASE_SCRIPT"..."	
						cp -f /data/app/$BASE_SCRIPT /sdcard/OpenRecovery/apps/$BASE_SCRIPT
					fi
					LEN=${#BASE_SCRIPT}
					if [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
					then
						DATA_PRESENT=1
					elif [ -d /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
					then
						DATA_PRESENT=1
					fi
					if [ $DATA_PRESENT -eq 1 ]
					then						
						LEN=${#BASE_SCRIPT}
						if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-4))} ]
						then
							echo "Updating "$BASE_SCRIPT" data..."	
							rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-4))}
							cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-4))} /sdcard/OpenRecovery/apps/data/
						else
							if [ ${BASE_SCRIPT:(-6):1} = - ]
							then
								LEN=${#BASE_SCRIPT}
								if [ -d /data/data/${BASE_SCRIPT:0:$(($LEN-6))} ]
								then
									echo "Updating "$BASE_SCRIPT" data..."	
									rm -fr /sdcard/OpenRecovery/apps/data/${BASE_SCRIPT:0:$(($LEN-6))}
									cp -fr /data/data/${BASE_SCRIPT:0:$(($LEN-6))} /sdcard/OpenRecovery/apps/data/
								else
									echo "Couldn't find data for "$2""
								fi
							fi
						fi
					else
						echo "Data folder not present in Recovery for "$BASE_SCRIPT", skipping..."
					fi
				done
			fi
			sleep 1;;	
	esac
