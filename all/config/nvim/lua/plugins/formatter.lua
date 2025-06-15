return {
	{
		'stevearc/conform.nvim',
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require('conform')

			conform.setup({
				formatters_by_ft = {
					lua = { "lua-language-server" },
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
					typescript = { 'prettier' },
					yaml = { "prettier" },
					yml = { "prettier" },
					php = { "phpcbf" },
					python = { "black" }
				},
				format_after_save = {
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,
				}
			})

			vim.keymap.set('n', '<C-f>', function()
				conform.format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,

				})
			end, { desc = "Format this buffer" })
		end
	},
}
