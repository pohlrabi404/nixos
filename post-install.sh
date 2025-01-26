#!/bin/bash
set -e

# move config to user directory
git clone https://github.com/pohlrabi404/nixos ~/.dotfiles
sudo chown -R $USER ~/.dotfiles
cd ~/.dotfiles
sudo mv /etc/nixos/hardware-configuration.nix ./machines/nixos/hardware-configuration.nix
echo "./hardware-configuration.nix" > .gitignore
sudo rm -rf /etc/nixos

sudo nixos-rebuild switch --flake . --extra-experimental-features 'nix-command flakes'

rm ~/post-install.sh
