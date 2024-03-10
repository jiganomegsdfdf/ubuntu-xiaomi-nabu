<img align="right" src="https://raw.githubusercontent.com/jiganomegsdfdf/ubuntu-xiaomi-nabu/master/ubnt.png" width="425" alt="Ubuntu 23.04 Running On A Xiaomi Pad 5">

# Ubuntu for Xiaomi Pad 5
This repo contians scripts for automatic building of ubuntu rootfs and kernel for Xiaomi Pad 5

# Where do i get needed files?
Actually, just go to the "Actions" tab, find one of latest builds and download files named **rootfs_(Desktop Environment you want)_(Kernel version you want)** and **nabu-boot_(Partition name)**
<br>for update download file named **xiaomi-nabu-debs_(Kernel version you want)**

## Update info
- Unpack .zip you downloaded
- Run dpkg -i *-xiaomi-nabu.deb
- P.S. if you are moving to another kernel version make that after installing .deb's
  <br>**First method**: just replace your old kernel version with the new kernel version in /boot/grub/grub.cfg
  <br>**Second method**: grub-install and grub-mkconfig -o /boot/grub/grub.cfg

# ⚠️ Read before INSTALL (Not tested info)
  If you want to stay on legacy boot(6.1.10 kernel(most stable by my eye)) follow this instructions:
 - Skip 4th install step
 - Boot into system(it will break himself)
 - Boot to fastboot
 - Flash boot again
  
## Install info
- Unpack .zip files you downloaded
- Unpack extracted rootfs.7z (there you take rootfs.img)
- rootfs.img must be flashed to the partition named as nabu-boot you chosen, but only text after "_"
- Partition for efi boot must be named "esp"(Only non-legacy boot)
- Flash boot that you have under nabu-boot archive

  


