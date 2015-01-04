#!/sbin/bbx sh

FSTYPE=`/sbin/bbx blkid /dev/block/platform/msm_sdcc.1/by-name/userdata | /sbin/bbx cut -d ' ' -f3 | /sbin/bbx cut -d '"' -f2`

if [ "$FSTYPE" == "ext4" ]
then
  /sbin/bbx rm /fstab_f2fs.msm8610
else
  /sbin/bbx cp -f /fstab_f2fs.msm8610 /etc/recovery.fstab
  /sbin/bbx mv -f /fstab_f2fs.msm8610 /fstab.msm8610
fi

MODEL=`/sbin/bbx cat /proc/cmdline | /sbin/bbx awk '{print $16}'| /sbin/bbx awk -F= '{print $2}'`

if [ "$MODEL" == "LG-D170" ]
then
    /sbin/bbx echo "/dev/block/zram0 none swap defaults zramsize=268435456" >> /fstab_f2fs.msm8610
fi
