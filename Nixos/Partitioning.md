Partitioning

### References:
- https://nixos.wiki/wiki/NixOS_Installation_Guide

## UEFI

g (gpt disk label)
n
1 (partition number [1/128])
2048 first sector
+500M last sector (boot sector size)
t
1 (EFI System)
n
2
default (fill up partition)
default (fill up partition)
t
44 (Linux LVM)
w (write)


## Disk Encryption
cryptsetup luksFormat /dev/[root_partition] (Ex. /dev/'nvme0n1p2', /dev/'sda2')
-- Enter and verify passphrase --


cryptsetup open /dev/[root_partition] [alias] (Ex. cryptsetup open /dev/nvme0n1p2 cryptImage)
-- Enter passphrase --


## Setup Logical Volume Management
pvcreate /dev/mapper/cryptImage
vgcreate vol1 /dev/mapper/cryptImage
vgdisplay (To get LV Size ((round down.... ex. 953.38 == 953))
lvcreate -L 953G -n image vol1 
lvdisplay (To review, should see 'LV Path: /dev/vol1/image')


## Label Partitions

lsblk
sudo mkfs.fat -F 32 /dev/nvme0n1p1
sudo fatlabel /dev/nvme0n1p1 NIXBOOT
sudo mkfs.ext4 /dev/vol1/image -L NIXROOT


## Mount Partitions
sudo mount /dev/vol1/image /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/nvme0n1p1 /mnt/boot


## Swap File Creation (OPTIONAL)
sudo dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=2097152 (2GB size)
sudo chmod 600 /mnt/.swapfile
sudo mkswap /mnt/.swapfile
sudo swapon /mnt/.swapfile


## Generate Nixos Config
sudo nixos-generate-config --root /mnt
cd /mnt/etc/nixos/
#### Copy over pre-configured configuration.nix file at this point. Update the UUID for the encrypted drive: 
#### Get current UUID: In vim command mode - :read ! blkid /dev/[YOUR_ROOT_PARTITION]
#### Copy/paste UUID into `boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/[UUID]";`, and delete the blkid line.
#### Jump to `Install`

#### To setup from scratch, continue:
sudo vim configuration.nix

Most essential changes:

keyboard layout, ie services.xserver.layout
users.users.user with adding entry initialPassword = "pw123";
networking (wifi), see below for fix if it breaks
boot.loader.grub.device = "/dev/sda"; #or "nodev" for efi only
install editor to edit the configuration 

### Disk Encryption Code for Configuration file:
```
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.grub.enable = true;
boot.loader.grub.device = "nodev";
boot.loader.grub.efiSupport = true;
boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/[ROOT_PARTITION_ID]";

```

### Install NixOS
cd /mnt
sudo nixos-install
