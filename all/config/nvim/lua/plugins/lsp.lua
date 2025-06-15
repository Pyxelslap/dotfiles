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
				ensured_installed = { "lua_ls", "ts_ls", "prettier" },
				automatic_installation = true
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.lua_ls.setup({
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
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = { 'css',
					'eruby',
					'html',
					'xml',
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
					includeLanguages = {},
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
			lspconfig.cssmodules_ls.setup({
				capabilities = capabilities,
				on_attach = custom_on_attach,
				init_options = {
					camelCase = 'dashes',
				},
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" },
				init_options = {
					provideFormatter = false
				}
			})
			lspconfig.css_variables.setup({
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" }
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = { "python" }
			})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				filetypes = { "php" }
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
				filetypes = { "sh" }
			})
			--
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set('n', '<leader>el', vim.diagnostic.setqflist, { desc = "Error list" })
		end
	}
}
