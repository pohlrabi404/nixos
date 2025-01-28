{ pkgs,homeDir, mkSymlink, lib, ... }:

{
    home.packages = with pkgs; [
        autotiling
    ];
	wayland.windowManager.sway = {
		enable = true;

		# temp fix
		checkConfig = false;
		package = pkgs.swayfx;
	};

    xdg.configFile."sway/config" = lib.mkForce {
        source = mkSymlink "${homeDir}/sway/.config/config";
    };
}

