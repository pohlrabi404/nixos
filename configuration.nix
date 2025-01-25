{ config, pkgs, ... }: 

{
	imports = [
		./hardware-configuration.nix
	];

	# systemd boot
	boot.loader.systemd-boot.enable = true;

	# enable openssh
	services.sshd.enable = true;

	# flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# users
	users.users.pohlrabi = {
		isNormalUser = true;
		description = "Purple Kohlrabi";
		home = "/home/pohlrabi";
		extraGroups = [ "networkmanager" "wheel" ];
	};

	networking.networkmanager.enable = true;

	environment.systemPackages = with pkgs; [
		vim
		git
	];
}
