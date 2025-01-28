local config = function()
	dofile(vim.g.base46_cache .. "treesitter")
	require("nvim-treesitter.configs").setup({
		ensure_installed = {},
        auto_installed = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	config = config,
    event = "User FilePost"
}
