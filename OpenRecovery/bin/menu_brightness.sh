#!/sbin/bash

echo "Set Display Brightness" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"
echo "*:break:*" >> "$MENU_FILE"
echo "100%:shell:brightness.sh 255" >> "$MENU_FILE"
echo " 75%:shell:brightness.sh 192" >> "$MENU_FILE"
echo " 50%:shell:brightness.sh 128" >> "$MENU_FILE"
echo " 20%:shell:brightness.sh  50" >> "$MENU_FILE"
echo " 10%:shell:brightness.sh  20" >> "$MENU_FILE"
echo "  5%:shell:brightness.sh  10" >> "$MENU_FILE"
