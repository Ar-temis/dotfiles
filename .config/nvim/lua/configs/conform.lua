local options = {
	formatters = {
		spotless = {
			command = "./mvnw",
			args = { "spotless:apply", "-DspotlessFiles=" .. "$FILENAME" },
			stdin = false,
			cwd = require("conform.util").root_file({ "mvnw", "pom.xml" }),
		},
	},
	formatters_by_ft = {
		-- python = function(bufnr)
		--   if require("conform").get_formatter_info("ruff_format", bufnr).available then
		--     return { "ruff_format" }
		--   else
		--     return { "isort", "black" }
		--   end
		-- end,
		python = { "isort", "black" },
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		js = { "biome" },
		tsx = { "biome" },
		java = { "spotless" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1500,
		lsp_fallback = true,
	},
}

return options
