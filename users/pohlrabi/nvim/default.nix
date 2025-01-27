{ config, pkgs, homeDir, mkSymlink, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
        plugins = with pkgs.vimPlugins; [
            lazy-nvim
        ];
	};

	xdg.configFile."nvim" = {
		recursive = true;
		source = mkSymlink "${homeDir}/nvim/.config";
	};
}
