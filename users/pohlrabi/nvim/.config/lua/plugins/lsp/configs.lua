local M = {}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

M.servers = {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},

				diagnostics = {
					global = { "vim" },
				},

				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
						"${3rd}/luv/library",
					},
					-- library = vim.api.nvim_get_runtime_file("", true),
					maxPreload = 100000,
					preloadFileSize = 10000,
					checkThirdParty = false,
				},

				runtime = {
					version = "LuaJIT",
					path = runtime_path,
				},
			},
		},
	},
	-- stylua = {},
	pyright = {
		settings = {
			python = {
				analysis = {
					diagnosticsSeverityOverrides = {
						reportUnusedExpression = "none",
					},
				},
			},
		},
	},

	ts_ls = {},
	-- eslint = {},
	-- prettierd = {},
	--
	nixd = {},
}

return M
