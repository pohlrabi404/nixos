-- user event that loads after UIEnter + only if file buf is there
AutoCmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
	group = AutoGroup("NvFilePost", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end

		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
			ExeAutoCmd("User", { pattern = "FilePost", modeline = false })
			vim.api.nvim_del_augroup_by_name("NvFilePost")

			vim.schedule(function()
				ExeAutoCmd("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(args.buf)
				end
			end)
		end
	end,
})

local map = vim.keymap.set

AutoCmd("LspAttach", {
	group = AutoGroup("lsp-attach-mapping", { clear = true }),
	callback = function()
		local builtin = require("fzf-lua")
		map("n", "gd", builtin.lsp_definitions, { desc = "[g]oto [d]efinitions" })
		map("n", "gr", builtin.lsp_references, { desc = "[g]oto [r]eferences" })
		map("n", "gi", builtin.lsp_implementations, { desc = "[g]oto [i]mplementations" })
		map("n", "gtd", builtin.lsp_typedefs, { desc = "[t]ype [d]definitions" })
		map("n", "gds", builtin.lsp_document_symbols, { desc = "[d]oc [s]ymbols" })
		map("n", "gws", builtin.lsp_live_workspace_symbols, { desc = "[w]ork [s]ymbols" })
		map("n", "gD", builtin.lsp_declarations, { desc = "[g]oto [D]eclaration" })
		map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })
		map("n", "<leader>ca", builtin.lsp_code_actions, { desc = "[c]ode [a]ction" })
	end,
})

AutoCmd("User", {
	pattern = "Fzf",
	callback = function()
		local fzf = require("fzf-lua")
		map("n", "<leader>fg", function()
			fzf.live_grep()
		end, { desc = "[f]iles [g]rep" })
		map("n", "<leader>fb", function()
			fzf.buffers()
		end, { desc = "[f]iles [b]uffers" })
	end,
})

-- AutoCmd("User", {
-- 	pattern = "MoltenKernelReady",
-- 	callback = function()
-- 		require("quarto").activate()
-- 		local runner = require("quarto.runner")
-- 		map("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
-- 		map("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
-- 		map("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
-- 		map("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
-- 		map("v", "<localleader>r", runner.run_range, { desc = "run visual range", silent = true })
-- 		map("n", "<localleader>RA", function()
-- 			runner.run_all(true)
-- 		end, { desc = "run all cells of all languages", silent = true })
-- 	end,
-- })
--
-- AutoCmd("FileType", {
-- 	pattern = "markdown",
-- 	callback = function()
-- 		vim.keymap.set("n", "<localleader>ck", function()
-- 			require("quarto")
-- 			vim.cmd.runtime("plugin/rplugin.vim")
-- 			local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
-- 			if venv ~= nil then
-- 				venv = string.match(venv, "/.+/(.+)")
-- 				vim.cmd(("MoltenInit shared %s"):format(venv))
-- 			else
-- 				vim.cmd("MoltenInit python3")
-- 			end
-- 		end, { desc = "[c]onnect [k]ernel" })
-- 	end,
-- })
