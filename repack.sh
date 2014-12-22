#!/bin/bash
# kernel repack script by Ghost44

KERNEL_NAME=Ghost_Kernel-FULL_GT-I9505-v1.0
KERNEL_DIR=/home/ghost44/android/kernel/Ghost-FULL-TW4.4-Galaxy-S4-LTE/Kernel
BOOT_IMG=$KERNEL_DIR/build/output
MODULES=$BOOT_IMG/modules
BUILD_USER="$USER"
REPACK_DIR=/home/ghost44/Kernel_Packer
FLASH_ZIP_FILES=$REPACK_DIR/zip_files
FLASH_ZIP_DIR=$FLASH_ZIP_FILES/$KERNEL_NAME
FLASH_ZIP_IMAGE_DIR=$FLASH_ZIP_DIR/ghost44
OUTPUT_DIR=$KERNEL_DIR/Ghost-Kernel-FULL-[GT-I9505]-v1.0

REPACK_KERNEL()
{	
	echo ""
	echo "=============================================="
	echo "START: REPACK_KERNEL"
	echo "=============================================="
	echo ""
	
	cd $REPACK_DIR
	cd $FLASH_ZIP_FILES
	mkdir $KERNEL_NAME
	mkdir ghost44
	mv ghost44 $KERNEL_NAME
	cp -R META-INF $KERNEL_NAME
        cp -R system $KERNEL_NAME
        cp -R props $KERNEL_NAME
        cp -R $MODULES $FLASH_ZIP_DIR/system/lib
	cd ../
	cp $BOOT_IMG/boot.img $FLASH_ZIP_IMAGE_DIR/boot.img
	cd $FLASH_ZIP_FILES
	cd $KERNEL_NAME
	zip -r $KERNEL_NAME.zip ghost44 META-INF system props
	rm -rf ghost44
        rm -r system/lib/modules
	rm -rf META-INF
        mv $KERNEL_NAME.zip $OUTPUT_DIR
	cd ../
	rm -rf $KERNEL_NAME
        rm -rf $BOOT_IMG/boot.img

	echo ""
	echo "=============================================="
	echo "END: REPACK_KERNEL"
	echo "=============================================="
	echo ""

}

# MAIN FUNCTION
rm -rf ./repack.log
(
	START_TIME=`date +%s`
	BUILD_DATE=`date +%m-%d-%Y`
	REPACK_KERNEL


	END_TIME=`date +%s`

	let "ELAPSED_TIME=$END_TIME-$START_TIME"
)

# Credits:
# Samsung
# google
# osm0sis
# cyanogenmod
# kylon
# thehacker911
