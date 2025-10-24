return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			'saadparwaiz1/cmp_luasnip'
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = 'InsertEnter',
		dependencies = {
			"hrsh7th/cmp-path",
			'hrsh7th/cmp-nvim-lsp'
		},
		config = function()
			local cmp = require 'cmp'
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' },
					{ name = 'codecompanion_variables' }
				})
			})
		end
	},
	{
		'gelguy/wilder.nvim',
		config = function()
			local wilder = require('wilder')
			wilder.setup({ modes = { ':', '/', '?' } })

			wilder.set_option('renderer', wilder.popupmenu_renderer({
				highlighter = wilder.basic_highlighter(),
			}))
		end
	},
}
