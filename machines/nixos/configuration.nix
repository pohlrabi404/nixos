{ config, pkgs, ... }: 

{
	imports = [
		./hardware-configuration.nix
		./keyd.nix
		./sway.nix
	];

	# state version
	system.stateVersion = "24.11";

	# systemd boot
	boot.loader.systemd-boot.enable = true;

	# enable openssh
	services.sshd.enable = true;

	# limit generations
	boot.loader.systemd-boot.configurationLimit = 5;

	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 1w";
	};

	# optimize store
	nix.settings.auto-optimise-store = true;
	

	# flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# users
	users.users.pohlrabi = {
		isNormalUser = true;
		description = "Purple Kohlrabi";
		home = "/home/pohlrabi";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	# network
	networking.networkmanager.enable = true;

	# system packages
	environment.systemPackages = with pkgs; [
		vim
		git
	];
}
