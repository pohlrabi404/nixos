{ config, pkgs, homeDir, mkSymlink, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
	};

	xdg.configFile."nvim" = {
		recursive = true;
		source = mkSymlink "${homeDir}/nvim/.config";
	};
}
