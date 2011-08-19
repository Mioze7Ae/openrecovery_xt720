#!/sbin/bash

for x in /{data,cache,sddata}/dalvik-cache /cache/dc ; do
    echo -n "Wiping $x... "
    rm -Rf $x/*
    echo done
done
