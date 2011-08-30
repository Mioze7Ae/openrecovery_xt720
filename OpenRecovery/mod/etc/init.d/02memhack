#!/system/bin/sh

chmod 771 /cache 
rm /data/dalvik-cache
cp -a /data/dalvik-cache /cache
rm -r /data/dalvik-cache
mkdir /cache/dalvik-cache
chown 1000.1000 /cache/dalvik-cache
chmod 771 /cache/dalvik-cache
ln -s /cache/dalvik-cache /data/dalvik-cache
log -p w dalvik-cache is now on /cache