#!/sbin/bash

case $1 in

	default)
			echo "set cam to Stock (720x480)..."
				sed -i "s/ro.media.enc.hprof.vid.width=.*/ro.media.enc.hprof.vid.width=720/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.height=.*/ro.media.enc.hprof.vid.height=480/g" /system/build.prop
				sed -i "s/ro.media.enc.vid.h264.width=.*/ro.media.enc.vid.h264.width=176,720/g" /system/build.prop
				sed -i "s/ro.media.enc.vid.h264.height=.*/ro.media.enc.vid.h264.height=144,480/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.fps=.*/ro.media.enc.hprof.vid.fps=30/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.bps=.*/ro.media.enc.hprof.vid.bps=5000000/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.aud.bps=.*/ro.media.enc.hprof.aud.bps=128000/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.aud.hz=.*/ro.media.enc.hprof.aud.hz=32000/g" /system/build.prop
			echo "done";;
		
	screen)
			echo "set cam to Screen (720x400)..."
				sed -i "s/ro.media.enc.hprof.vid.width=.*/ro.media.enc.hprof.vid.width=720/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.height=.*/ro.media.enc.hprof.vid.height=400/g" /system/build.prop
				sed -i "s/ro.media.enc.vid.h264.width=.*/ro.media.enc.vid.h264.width=176,720/g" /system/build.prop
				sed -i "s/ro.media.enc.vid.h264.height=.*/ro.media.enc.vid.h264.height=144,400/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.fps=.*/ro.media.enc.hprof.vid.fps=30/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.bps=.*/ro.media.enc.hprof.vid.bps=5000000/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.aud.bps=.*/ro.media.enc.hprof.aud.bps=128000/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.aud.hz=.*/ro.media.enc.hprof.aud.hz=32000/g" /system/build.prop
			echo "done.";;
			
	pal)
			echo "set cam to PAL (720x576)..."
				sed -i "s/ro.media.enc.hprof.vid.width=.*/ro.media.enc.hprof.vid.width=720/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.height=.*/ro.media.enc.hprof.vid.height=576/g" /system/build.prop
				sed -i "s/ro.media.enc.vid.h264.width=.*/ro.media.enc.vid.h264.width=176,720/g" /system/build.prop
				sed -i "s/ro.media.enc.vid.h264.height=.*/ro.media.enc.vid.h264.height=144,576/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.fps=.*/ro.media.enc.hprof.vid.fps=30/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.vid.bps=.*/ro.media.enc.hprof.vid.bps=5000000/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.aud.bps=.*/ro.media.enc.hprof.aud.bps=128000/g" /system/build.prop
				sed -i "s/ro.media.enc.hprof.aud.hz=.*/ro.media.enc.hprof.aud.hz=32000/g" /system/build.prop
			echo "done";;
esac