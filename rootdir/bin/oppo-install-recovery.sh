#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a9cfed800ca4998a78c9d17eb417f51a0f3b10f3; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:0c47190a8ef6b730661dc17ae164571513369a40 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a9cfed800ca4998a78c9d17eb417f51a0f3b10f3 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
