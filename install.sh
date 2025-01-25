#!/bin/bash

# exit when an error happens
set -e

# partitioning
echo "Disks list"
fdisk -l
read -p "Enter disk: " DISK

#	wiping before partitioning
wipefs --all --force $DISK

#	disk partitions
parted $DISK -- mklabel gpt
parted $DISK -- mkpart root ext4 2GB -8GB
parted $DISK -- mkpart swap linux-swap -8GB 100%
parted $DISK -- mkpart ESP fat32 1MB 2GB
parted $DISK -- set 3 esp on

#	disk formatting
mkfs.ext4 -L nixos ${DISK}1
mkswap -L swap ${DISK}2
mkfs.fat -F 32 -n boot ${DISK}3
swapon ${DISK}2

# mount
mount /dev/disk/by-label/nixos /mnt
mount --mkdir -o umask=077 /dev/disk/by-label/boot /mnt/boot
curl -O https://raw.githubusercontent.com/pohlrabi404/nixos/refs/heads/main/configuration.nix 
# generate config
nixos-generate-config --root /mnt
mv configuration.nix /mnt/etc/nixos/configuration.nix
nixos-install

# config user password
nixos-enter --root /mnt -c "passwd pohlrabi"

# post install script
curl -O https://raw.githubusercontent.com/pohlrabi404/nixos/refs/heads/main/post-install.sh
mv post-install.sh /mnt/home/pohlrabi/post-install.sh
chmod +x /mnt/home/pohlrabi/post-install.sh

reboot
