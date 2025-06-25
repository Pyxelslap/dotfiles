return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
		},
		config = function()
			local env = require('../config/env')
			require('codecompanion').setup({
				adapters = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = env.gemini_key
							},
						})
					end,
				},
				strategies = {
					-- Change the default chat adapter
					chat = {
						adapter = "gemini",
						opts = {
							completion_provider = "cmp",
						}
					},
					inline = {
						adapter = "gemini",
					},
					cmd = {
						adapter = "gemini",
					},
				},
				opts = {
					log_level = "ERROR", -- TRACE|DEBUG|ERROR|INFO
					language = "Indonesian", -- The language used for LLM responses

					-- If this is false then any default prompt that is marked as containing code
					-- will not be sent to the LLM. Please note that whilst I have made every
					-- effort to ensure no code leakage, using this is at your own risk
					---@type boolean|function
					---@return boolean
					send_code = true,

					job_start_delay = 1500, -- Delay in milliseconds between cmd tools
					submit_delay = 0,  -- Delay in milliseconds before auto-submitting the chat buffer
				},
				display = {
					chat = {
						window = {
							layout = "float", -- float|vertical|horizontal|buffer
							position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
							border = "single",
							height = 0.8,
							width = 0.8,
							relative = "editor",
							full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
							opts = {
								breakindent = true,
								cursorcolumn = false,
								cursorline = false,
								foldcolumn = "0",
								linebreak = true,
								list = false,
								numberwidth = 1,
								signcolumn = "no",
								spell = false,
								wrap = true,
								number = false,
							},
						},
						show_header_separator = true,
					}
				}
			})
		end
	},
}
