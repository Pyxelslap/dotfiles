return {
	{
		"williamboman/mason.nvim",
		event = 'VeryLazy',
		config = function()
			require('mason').setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensured_installed = { "lua_ls", "ts_ls", "prettier", "emmet-language-server" },
				automatic_installation = true
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lsp_list = { "lua_ls", "emmet_language_server", "bashls" }

			for i, lsp in ipairs(lsp_list) do
				vim.lsp.enable(lsp)
			end
			-- LSP Config
			vim.lsp.config('lua_ls', {
				capabilities = capabilities,
				filetypes = { "lua" },
				settings = {
					lua = {
						diagnostics = {
							enable = true,
							globals = { "vim" }
						}
					}
				}
			})
			vim.lsp.config('ts_ls', {
				capabilities = capabilities,
				filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
			})
			vim.lsp.config('emmet_language_server', {
				capabilities = capabilities,
				filetypes = { 'css',
					'eruby',
					'html',
					'xml',
					'tmpl',
					'htmldjango',
					'javascriptreact',
					'less',
					'pug',
					'php',
					'sass',
					'scss',
					'typescriptreact',
					'htmlangular',
				},
				init_options = {
					includeLanguages = { 'xml' },
					excludeLanguages = {},
					extensionsPath = {},
					preferences = {},
					showAbbreviationSuggestions = true,
					showExpandedAbbreviation = "always",
					showSuggestionsAsSnippets = false,
					syntaxProfiles = {},
					variables = {},
				},
			})
			vim.lsp.config('cssls', {
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" },
				init_options = {
					provideFormatter = false
				}
			})
			vim.lsp.config('pyright', {
				capabilities = capabilities,
				filetypes = { "python" }
			})
			vim.lsp.config('intelephense', {
				capabilities = capabilities,
				filetypes = { "php" }
			})
			vim.lsp.config('bashls', {
				capabilities = capabilities,
				filetypes = { "sh" }
			})
		end
	}
}
