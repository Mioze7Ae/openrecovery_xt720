#!/sbin/sh

echo "Replacing sholesp2a-keypad.kcm.bin."

cp -f "/sdcard/OpenRecovery/keychars/$1/sholesp2a-keypad.kcm.bin" /system/usr/keychars/sholesp2a-keypad.kcm.bin 2>/dev/null
chmod 0644 /system/usr/keychars/sholesp2a-keypad.kcm.bin 2>/dev/null

echo "Replacing sholesp2a-keypad.kl"

cp -f "/sdcard/OpenRecovery/keychars/$1/sholesp2a-keypad.kl" /system/usr/keylayout/sholesp2a-keypad.kl 2>/dev/null
chmod 0644 /system/usr/keylayout/sholesp2a-keypad.kln 2>/dev/null

echo "Patching default.prop."

sed -i "s/ro\.keyboard\.type=.*/ro.keyboard.type=$1/" /system/default.prop 2>/dev/null

echo "Keyboard layout has been changed to $1."

#Added by Skrilax_CZ -> console uses its own layout (hardcoded)

if [ "$1" == "qwerty" -o "$1" == "euro_qwerty" ]; then
	echo "QWERTY" > /etc/keyboard
	echo "QWERTY" > /sdcard/OpenRecovery/etc/keyboard
	echo "Recovery Console keyboard layout changed to QWERTY."
fi

if [ "$1" == "qwertz" ]; then
	echo "QWERTZ" > /etc/keyboard
	echo "QWERTZ" > /sdcard/OpenRecovery/etc/keyboard
	echo "Recovery Console keyboard layout changed to QWERTZ."
fi

if [ "$1" == "azerty" ]; then
	echo "AZERTY" > /etc/keyboard
	echo "AZERTY" > /sdcard/OpenRecovery/etc/keyboard
	echo "Recovery Console keyboard layout changed to AZERTY."
fi
