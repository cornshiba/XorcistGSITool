#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BASE_DIR=$1

if [ -d "$BASE_DIR/product" ] && [ ! -L "$BASE_DIR/product" ]; then
    product="$BASE_DIR/product"
elif [ -d "$BASE_DIR/system/product" ] && [ ! -L "$BASE_DIR/system/product" ]; then
    product="$BASE_DIR/system/product"
else
    echo "error: No product dir"
    exit 1
fi

if [ -d "$BASE_DIR/system_ext" ] && [ ! -L "$BASE_DIR/system_ext" ]; then
    system_ext="$BASE_DIR/system_ext"
elif [ -d "$BASE_DIR/system/system_ext" ] && [ ! -L "$BASE_DIR/system/system_ext" ]; then
    system_ext="$BASE_DIR/system/system_ext"
else
    echo "error: No system_ext dir"
    exit 1
fi

rm -rf $BASE_DIR/system/app/AsusSetupWizard
rm -rf $BASE_DIR/system/app/NewBacaPlus
rm -rf $BASE_DIR/system/app/Blibli
rm -rf $BASE_DIR/system/app/Facebook*
rm -rf $BASE_DIR/system/app/GameBroadcasterService
rm -rf $BASE_DIR/system/app/Instagram
rm -rf $BASE_DIR/system/priv-app/AsusDataTransfer
rm -rf $BASE_DIR/system/priv-app/AsusTips
rm -rf $BASE_DIR/system/priv-app/Facebook*
rm -rf $BASE_DIR/system/priv-app/GameBroadcaster
rm -rf $BASE_DIR/system/priv-app/MyASUS
rm -rf $BASE_DIR/system/priv-app/MLModel
rm -rf $product/app/Chrome
rm -rf $product/app/Gemini
rm -rf $product/app/Gmail2
rm -rf $product/app/Maps
rm -rf $product/app/YouTube
rm -rf $product/app/YTMusic
rm -rf $product/priv-app/PersonalSafety
rm -rf $product/priv-app/Velvet*

# Switch to OpenCamera
rm -rf $BASE_DIR/system/priv-app/AsusCamera
rsync -ra $SCRIPT_DIR/OpenCamera $BASE_DIR/system/priv-app/

# Switch to AOSP init
rsync -ra $SCRIPT_DIR/bin/ $BASE_DIR/system/bin/

# Siwtch to AOSP libfsmgr
rsync -ra $SCRIPT_DIR/lib64/ $BASE_DIR/system/lib64/

# Remove beta features
sed -i "s/ro.vendor.asus.logupload=1/ro.vendor.asus.logupload=0/g" $BASE_DIR/system/build.prop
sed -i "s/ro.vendor.asus.beta=1/ro.vendor.asus.beta=0/g" $BASE_DIR/system/build.prop

