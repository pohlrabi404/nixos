{ config, pkgs, homeDir, mkSymlink, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
        plugins = with pkgs.vimPlugins; [
            lazy-nvim

            # ui
            nvchad-ui
            base46
        ];

        extraLuaConfig = ''

vim.g.mapleader = " "
require("lazy").setup({
    { import = "plugins" },
    }, {
    performance = {
        reset_packpath = false,
        rtp = {
            reset = false,
        },
    },
    dev = {
        path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
        patterns = {""},
    },
    install = {
        missing = false,
    },
})

require("options")

        '';
	};

	xdg.configFile."nvim/lua" = {
		recursive = true;
		# source = ./.config/lua;
		source = mkSymlink "${homeDir}/nvim/.config/lua";
	};
}
