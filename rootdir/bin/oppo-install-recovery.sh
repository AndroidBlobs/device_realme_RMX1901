#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:322f7b0671576866f3d3371788b849f8f3ec7596; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:ebed9732ac09fe4a7ef45ccba57646d205a763d4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:322f7b0671576866f3d3371788b849f8f3ec7596 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
