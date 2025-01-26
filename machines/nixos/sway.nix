{ config, pkgs, ... }:

{
	# sway related
	security.polkit.enable = true;
	hardware.graphics = {
		enable = true;
	};

	services.getty.autologinUser = "pohlrabi";
}
