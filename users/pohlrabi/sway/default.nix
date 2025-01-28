{ pkgs,homeDir, mkSymlink, ... }:

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

    xdg.configFile."sway" = {
        recursive = true;
        source = mkSymlink "${homeDir}/sway/.config";
    };
}

