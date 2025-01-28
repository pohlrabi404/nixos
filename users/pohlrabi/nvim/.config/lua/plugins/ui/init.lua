return {
	{
		"stevearc/dressing.nvim",
		event = { "User FilePost" },
		opts = {},
	},
	{
		"uga-rosa/ccc.nvim",
		-- lazy = false,
		init = function()
			AutoCmd("FileType", {
				pattern = { "lua", "css" },
				callback = function()
					vim.schedule(function()
						require("ccc")
					end)
				end,
			})
		end,
		opts = {
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		},
	},
	{
		"nvchad/nvchad-ui",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},
	{
		"nvchad/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{ "nvzone/nvzone-volt" },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		opts = {
			indent = { char = "|", highlight = "IblChar" },
			scope = { char = "|", highlight = "IblScopeChar" },
		},
		config = require("plugins.ui.ibl").config,
	},
}
