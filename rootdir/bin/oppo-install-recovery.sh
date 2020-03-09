#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:55dcd364311e6c593d0e1ebd81ded1c647de179f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:487392aac3a9b2aac76ce856c7b448527c225ba9 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:55dcd364311e6c593d0e1ebd81ded1c647de179f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
