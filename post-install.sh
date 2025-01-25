#!/bin/bash
set -e

# move config to user directory
git clone https://github.com/pohlrabi404/nixos ~/.dotfiles
sudo chown -R $USER ~/.dotfiles
cd ~/.dotfiles
sudo mv /etc/nixos/hardware-configuration.nix hardware-configuration.nix
echo "./hardware-configuration.nix" > .gitignore
rm -rf /etc/nixos

sudo nix flake update #remove this after having a proper repo with flake.lock
sudo nixos-rebuild switch --flake .

rm ~/post-install.sh
