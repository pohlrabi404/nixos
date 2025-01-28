local M = {}

M.config = function()
	local servers = require("plugins.lsp.configs").servers

	for k, v in pairs(servers) do
		local server = v or {}
		server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
		require("lspconfig")[k].setup(server)
	end

	-- diagnostic
	if vim.g.have_nerd_font then
		local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
		local diagnostic_signs = {}
		for type, icon in pairs(signs) do
			diagnostic_signs[vim.diagnostic.severity[type]] = icon
		end
		vim.diagnostic.config({ signs = { text = diagnostic_signs } })
	end

	require("plugins.lsp.events").setup()
end

return M
