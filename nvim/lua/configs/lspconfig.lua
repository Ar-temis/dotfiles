require("nvchad.configs.lspconfig").defaults()

vim.diagnostic.config({
	virtual_text = false,
	float = { border = "rounded", source = true },
	signs = true,
	underline = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "Orange" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "LightBlue" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "LightGrey" })

local servers = {
	"html",
	"cssls",
	"clangd",
	"ruff",
	"jedi_language_server",
	"pyright",
	"postgres_lsp",
	"ts_ls",
	"lua_ls",
	"harper_ls",
}
vim.lsp.config("harper_ls", {
	filetypes = { "markdown" },
	settings = {
		["harper-ls"] = {
			linters = {
				SpellCheck = false,
				SpelledNumbers = false,
				AnA = true,
				SentenceCapitalization = false,
				UnclosedQuotes = true,
				WrongQuotes = false,
				LongSentences = true,
				RepeatedWords = true,
				Spaces = true,
				Matcher = true,
				CorrectNumberSuffix = true,
			},
			codeActions = {
				ForceStable = false,
			},
			markdown = {
				IgnoreLinkTitle = false,
			},
			diagnosticSeverity = "hint",
			isolateEnglish = false,
			dialect = "American",
			maxFileLength = 120000,
			ignoredLintsPath = "",
			excludePatterns = {},
		},
	},
})

vim.lsp.config("ruff", {
	init_options = {
		settings = {
			line_length = 120,
		},
	},
})

vim.lsp.config("pyright", {
	settings = {
		pyright = {
			disableOrganizeImports = true,
			disableLanguageServices = true,
		},
	},
})

vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 120,
				},
			},
		},
	},
})
vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers
