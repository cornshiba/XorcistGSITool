# Vendor overlays
mount -o bind /system/FoxetGSI/vo /vendor/overlay || true
mount -o bind /system/FoxetGSI/group /vendor/etc/group || true
mount -o bind /system/FoxetGSI/passwd /vendor/etc/passwd || true
