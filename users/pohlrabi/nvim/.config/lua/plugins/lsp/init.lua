return {
	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = require("plugins.lsp.mason").config,
		opts = {},
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
