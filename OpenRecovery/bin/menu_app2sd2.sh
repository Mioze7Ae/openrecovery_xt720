#!/sbin/sh

echo "THIS WILL ERASE ALL YOUR DATA on your SDcard!!!" > "$MENU_FILE"
echo "Go Back:menu:.." >> "$MENU_FILE"
echo "Split 8GB SDCard (1GB ext2):shell:app2sd.sh 8gb" >> "$MENU_FILE"
echo "Split 16GB SDCard (1GB ext2):shell:app2sd.sh 16gb" >> "$MENU_FILE"
echo "Split 32GB SDCard (1GB ext2):shell:app2sd.sh 32gb" >> "$MENU_FILE"