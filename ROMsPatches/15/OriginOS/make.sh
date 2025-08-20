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

rm -rf $system/app/AgentScreen
rm -rf $system/app/AudioEffect
rm -rf $system/app/BBKAccount
rm -rf $system/app/BBKAppStore
rm -rf $system/app/BBKCloud
rm -rf $system/app/BBKLOG
rm -rf $system/app/BBKMusic
rm -rf $system/app/BBKWeatherProvider
rm -rf $system/app/BasePlayer
rm -rf $system/app/CarLauncher
rm -rf $system/app/GlobalSearch
rm -rf $system/app/JoviCopilot
rm -rf $system/app/MagazineService
rm -rf $system/app/PrintSpooler
rm -rf $system/app/SuperCard
rm -rf $system/app/VLife_vivo
rm -rf $system/app/VTouch
rm -rf $system/app/VisionAid
rm -rf $system/app/VivoAccessibility
rm -rf $system/app/VivoAssistant
rm -rf $system/app/VivoCalendar
rm -rf $system/app/VivoCamera
rm -rf $system/app/VivoGptAgent
rm -rf $system/app/VivoKaraoke
rm -rf $system/app/VivoSmartNlp
rm -rf $system/app/VivoTws
rm -rf $system/app/VivoUnionApk
rm -rf $system/app/VoiceRecognition
rm -rf $system/app/VoiceWakeup
rm -rf $system/app/vivoPay
rm -rf $system/app/vivoWallet
rm -rf $system/app/vivospace-v2
rm -rf $system/custom/app/AiTranslate
rm -rf $system/custom/app/AllDocuments
rm -rf $system/custom/app/BBKCalculator
rm -rf $system/custom/app/BBKNotes
rm -rf $system/custom/app/BBKSoundRecorder
rm -rf $system/custom/app/BBKWeather
rm -rf $system/custom/app/BBKWidgetWeather
rm -rf $system/custom/app/Behavior
rm -rf $system/custom/app/BehaviorCity
rm -rf $system/custom/app/BehaviorMountain
rm -rf $system/custom/app/BehaviorSkyLight
rm -rf $system/custom/app/ChildrenMode
rm -rf $system/custom/app/FamilyCare
rm -rf $system/custom/app/Feedback
rm -rf $system/custom/app/healthCare
rm -rf $system/custom/app/healthwidget
rm -rf $system/custom/app/iReader
rm -rf $system/custom/app/iRoaming
rm -rf $system/custom/app/iRoamingService
rm -rf $system/custom/app/ihealth
rm -rf $system/custom/app/LauncherCopilot
rm -rf $system/custom/app/MountainRoad
rm -rf $system/custom/app/NewsReader
rm -rf $system/custom/app/PureSearch
rm -rf $system/custom/app/SmartOffice
rm -rf $system/custom/app/VivoDreamMusicApp
rm -rf $system/custom/app/VivoDreamWeatherApp
rm -rf $system/custom/app/VivoPhoto
rm -rf $system/custom/app/vivogame
rm -rf $system/custom/priv-app/AppRecommendation
rm -rf $system/custom/priv-app/EasyShare
rm -rf $system/custom/priv-app/Email

# Switch to patched init
rsync -ra $SCRIPT_DIR/bin/ $BASE_DIR/system/bin/

# Siwtch to patched libfsmgr
rsync -ra $SCRIPT_DIR/lib64/ $BASE_DIR/system/lib64/

# Apply build.prop stuff
cat $SCRIPT_DIR/build.prop >> $BASE_DIR/system/build.prop
