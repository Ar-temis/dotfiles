require("nvchad.mappings")

local map = vim.keymap.set
--
-- add yours here
map("i", "<Tab>", function()
	local supermaven_preview = require("supermaven-nvim.completion_preview")
	local blink = require("blink.cmp")

	-- If Supermaven ghost visible
	if supermaven_preview.has_suggestion and supermaven_preview.has_suggestion() then
		supermaven_preview.on_accept_suggestion()
		return
	end

	-- If blink menu visible
	if blink.is_visible() then
		blink.accept()
		return
	end

	-- Otherwise insert literal tab
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
end, { desc = "Smart Tab (Supermaven > Blink > Tab)" })
-- Center screen on scroll
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Command mode shortcut
map("n", ";", ":", { desc = "CMD enter command mode" })

map("x", "<leader>p", '"_dP', { desc = "Paste without overwriting yank register" })

-- Escape shortcut
map("i", "jk", "<ESC>")

-- =========================
-- LSP Code Actions (Harper)
-- =========================

-- Normal mode
map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

-- Visual mode (important for grammar tools)
map("v", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<A-r>", function()
	require("custom.run_file").run()
end, { desc = "Run current file" })
