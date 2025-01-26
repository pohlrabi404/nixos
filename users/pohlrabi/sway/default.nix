{ config, pkgs, ... }:

{
	wayland.windowManager.sway = {
		enable = true;

		# temp fix
		checkConfig = false;
		package = pkgs.swayfx;
		config = rec {
			modifier = "Mod4";
			terminal = "kitty";
		};
	
	home.file.".bash_profile".text = ''
		if [ "$(tty)" = "/dev/tty1" ];
		then
			exec sway
		fi
	'';
}

