local options = {
	formatters_by_ft = {
		python = { "isort", "black" },
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		js = { "biome" },
		tsx = { "biome" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1500,
		lsp_fallback = true,
	},
}

return options
