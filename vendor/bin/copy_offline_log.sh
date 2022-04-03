#!/system/bin/sh

BUILDPROP=/system/build.prop
LOGCATLOG=/data/misc/logd
RECOVERYLOG=/cache/recovery
TOMBSTONES=/data/tombstones
ANR=/data/anr
PANIC=/data/panic
BLUEDROID=/data/misc/bluedroid
DIAGNOSIS=/data/diagnosis/boot_log.tar.gz

AUTOCOPYFILE=.COPYLOGS
USB_STORAGE_DIR=/storage

ls $USB_STORAGE_DIR | while read LINE
do
	USB_STORAGE=$USB_STORAGE_DIR/$LINE

	if [ $LINE == "emulated" ] || [ $LINE == "self" ]; then
		continue
	fi

	if [ -d $USB_STORAGE ] && [ -f $USB_STORAGE/$AUTOCOPYFILE ]; then
		COPYLOG=$USB_STORAGE/logs-$(date +%y%m%d_%H%M%S)
		mkdir $COPYLOG

		if [ -f $BUILDPROP ]; then
			busybox cp -rf $BUILDPROP $COPYLOG
		fi
		if [ -d $LOGCATLOG ]; then
			busybox cp -rf $LOGCATLOG $COPYLOG
		fi
		if [ -d $RECOVERYLOG ]; then
			busybox cp -rf $RECOVERYLOG $COPYLOG
		fi
		if [ -d $TOMBSTONES ]; then
			busybox cp -rf $TOMBSTONES $COPYLOG
		fi
		if [ -d $ANR ]; then
			busybox cp -rf $ANR $COPYLOG
		fi
		if [ -d $BLUEDROID ]; then
			busybox cp -rf $BLUEDROID $COPYLOG
		fi
		if [ -f $DIAGNOSIS ]; then
			busybox cp -rf $DIAGNOSIS $COPYLOG
		fi
		if [ -d $PANIC ]; then
                        busybox cp -rf $PANIC $COPYLOG
                fi
	fi
done
