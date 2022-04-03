#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/recovery:15923712:def6fa9cf7ba4497351f03e87e4ca1831a318c58; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/boot:10940928:f42b6520b9e05040db9ff34b4f81c9cbfbc6b463 EMMC:/dev/block/recovery def6fa9cf7ba4497351f03e87e4ca1831a318c58 15923712 f42b6520b9e05040db9ff34b4f81c9cbfbc6b463:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
