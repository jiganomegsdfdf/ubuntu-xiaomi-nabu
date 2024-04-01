#!/bin/bash

grub-install
grub-mkconfig -o /boot/grub/grub.cfg

boot_a_md5sum=$(md5sum /dev/disk/by-partlabel/boot_a | cut -d' ' -f1)
boot_b_md5sum=$(md5sum /dev/disk/by-partlabel/boot_b | cut -d' ' -f1)
checksum_file_data=$(cat /firstboot/checksum | tr -d '\n')
if [[ $checksum_file_data = *"$boot_a_md5sum"* ]]; then
  target_partition="boot_a"
else
	if [[ $checksum_file_data = *"$boot_b_md5sum"* ]]; then
	  target_partition="boot_b"
	else
	  echo "Error: MD5 checksum of /dev/disk/by-partlabel/boot_a and boot_b does not match any checksum in /firstboot/checksum"
   	  systemctl disable nabu-grub
	  systemctl mask nabu-grub
	  exit 1
	fi
fi

dd if=/firstboot/boot.img of=/dev/disk/by-partlabel/$target_partition

rm -rf /firstboot
systemctl disable nabu-grub
systemctl mask nabu-grub
reboot -f
