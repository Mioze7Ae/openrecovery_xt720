#!/sbin/bash

echo "Bash Settings" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"

if [ -f /etc/bash/.nobashcolors ]; then
	echo "Enable Colors:shell:bash_enable_colors.sh" >> "$MENU_FILE"
else
	echo "Disable Colors:shell:bash_disable_colors.sh" >> "$MENU_FILE"
fi
