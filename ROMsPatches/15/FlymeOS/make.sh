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

rm -rf $BASE_DIR/system/app/AicyManager
rm -rf $BASE_DIR/system/app/AppCenter
rm -rf $BASE_DIR/system/app/MzPay
rm -rf $BASE_DIR/system/app/MzShare
rm -rf $BASE_DIR/system/app/MzUpdate
rm -rf $BASE_DIR/system/app/MzCloudService
rm -rf $BASE_DIR/system/app/NetAdmin
rm -rf $BASE_DIR/system/app/StarryCarLink
rm -rf $BASE_DIR/system/app/MzSyncService
rm -rf $BASE_DIR/system/app/UPTsmService
rm -rf $BASE_DIR/system/app/WPS_Meizu_Version
rm -rf $BASE_DIR/system/MzApp/AgentStore
rm -rf $BASE_DIR/system/MzApp/Email
rm -rf $BASE_DIR/system/MzApp/FamilyGuard
rm -rf $BASE_DIR/system/MzApp/Find
rm -rf $BASE_DIR/system/MzApp/FlymeMusic
rm -rf $BASE_DIR/system/MzApp/GameCenter
rm -rf $BASE_DIR/system/MzApp/GameSDKService
rm -rf $BASE_DIR/system/MzApp/mCareNew
rm -rf $BASE_DIR/system/MzApp/MeizuPay
rm -rf $BASE_DIR/system/MzApp/MYVU
rm -rf $BASE_DIR/system/MzApp/MzAdApp
rm -rf $BASE_DIR/system/MzApp/mzbbs
rm -rf $BASE_DIR/system/MzApp/MzStore
rm -rf $BASE_DIR/system/MzApp/Pedometer
rm -rf $BASE_DIR/system/MzApp/Reader
rm -rf $BASE_DIR/system/MzApp/RemoteCooperation
rm -rf $BASE_DIR/system/MzApp/Scanner
rm -rf $BASE_DIR/system/MzApp/SmartHome
rm -rf $BASE_DIR/system/MzApp/Toolbox
rm -rf $BASE_DIR/system/MzApp/Video
rm -rf $BASE_DIR/system/MzApp/VideoClips
rm -rf $BASE_DIR/system/MzApp/VoiceAssistant
rm -rf $BASE_DIR/system/MzApp/Weather
rm -rf $BASE_DIR/system/priv-app/AppSandbox
rm -rf $BASE_DIR/system/priv-app/Assistant
rm -rf $BASE_DIR/system/priv-app/Browser
rm -rf $BASE_DIR/system/priv-app/DirectService
rm -rf $BASE_DIR/system/priv-app/Feedback
rm -rf $BASE_DIR/system/priv-app/Linkpc
rm -rf $BASE_DIR/system/priv-app/MzBasestationSafe
rm -rf $BASE_DIR/system/priv-app/Picker
rm -rf $BASE_DIR/system/priv-app/Search
rm -rf $BASE_DIR/system/priv-app/StarryNet
rm -rf $BASE_DIR/system/priv-app/Suggestion
rm -rf $BASE_DIR/system/priv-app/TaskAgent
rm -rf $BASE_DIR/system/priv-app/VoiceInteract
rm -rf $BASE_DIR/system/priv-app/VSimCos
rm -rf $product/custom/*
rm -rf $system_ext/app/FlymeAIService

# Switch to AOSP SetupWizard
rm -rf $BASE_DIR/system/priv-app/MzSetupWizard
rsync -ra $SCRIPT_DIR/SetupWizard $BASE_DIR/system/priv-app/

# Switch to OpenCamera
rm -rf $BASE_DIR/system/app/Camera
rsync -ra $SCRIPT_DIR/OpenCamera $BASE_DIR/system/priv-app/

# Switch to AOSP init
rsync -ra $SCRIPT_DIR/bin/ $BASE_DIR/system/bin/

# Siwtch to AOSP libfsmgr
rsync -ra $SCRIPT_DIR/lib64/ $BASE_DIR/system/lib64/
