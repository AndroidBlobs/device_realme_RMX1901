#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:aa9eed73f7e393b633952f0515260dfce316ee05; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:24adc58ec807d156dbdabe5f675322b8e51084ad \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:aa9eed73f7e393b633952f0515260dfce316ee05 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
