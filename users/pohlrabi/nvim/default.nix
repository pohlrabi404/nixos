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
vim.g.maplocalleader = ";"

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

AutoCmd = vim.api.nvim_create_autocmd
AutoGroup = vim.api.nvim_create_augroup
ExeAutoCmd = vim.api.nvim_exec_autocmds

require("lazy").setup({
    { import = "plugins" },
    }, {
    dev = {
        path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
        patterns = {""},
    },
    install = {
        missing = false,
    },
    defaults = { lazy = true },

	colorscheme = "industry",

	change_detection = { notify = false },

	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
        reset_packpath = false,
		rtp = {
            reset = false,
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("autocmds")

vim.schedule(function()
    require("mappings")
end)

        '';
	};

	xdg.configFile."nvim/lua" = {
		recursive = true;
		# source = ./.config/lua;
		source = mkSymlink "${homeDir}/nvim/.config/lua";
	};
}
