return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = {
				"*",
				css = { css = true, rgb_fn = true, names = false },
				html = { names = false }
			}
		},
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	},
	{
		'wakatime/vim-wakatime',
		lazy = false
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		opts = {},
		config = function()
			local headerlogo = require('../config/header_ascii_art')
			local db = require('dashboard')
			db.setup {
				theme = 'doom',
				config = {
					header = headerlogo.impressed_anime_girl,
					week_header = {
						enable = false,
					},
					center = {
						{
							icon = 'פּ ',
							desc = 'Open Neotree window',
							desc_hl = 'String',
							key = 't',
							key_hl = 'Number',
							action = 'Neotree filesystem current'
						},
						{
							icon = ' ',
							desc = 'Find File',
							desc_hl = 'String',
							key = 'b',
							key_hl = 'Number',
							action = 'Telescope fd'
						},
						{
							icon = 'ﮧ ',
							desc = 'AI chatbox',
							desc_hl = 'String',
							key = 'ai',
							key_hl = 'Number',
							action = 'CodeCompanionChat'
						},
						{
							icon = ' ',
							desc = 'Exit Neovim',
							desc_hl = 'String',
							key = 'q',
							key_hl = 'Number',
							action = 'q!'
						},
					},
				},
			}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},
	{
		'vyfor/cord.nvim',
		build = ':Cord update',
		-- opts = {}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			triggers = {
				{ "leader", mode = { "n", "v" } }
			}
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show()
				end,
				desc = "Keymaps (which-key)",
			},
		},
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		},
		config = function()
			require("cheatsheet").setup({
				telescope_mappings = {
					['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
					['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
					['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
				}
			})
		end
	}
}
