local config = function()
	dofile(vim.g.base46_cache .. "treesitter")
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua" },
		modules = {},
		ignore_install = {},
		sync_install = true,
		auto_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	config = config,
}
