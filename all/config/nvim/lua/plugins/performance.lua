return {
	{
		"LunarVim/bigfile.nvim",
		event = "BufReadPre",
		config = function()
			require('bigfile').setup({
				filesize = 1,
			})
		end
	},
	{
		"karb94/neoscroll.nvim",
		event = 'WinScrolled',
		config = function()
			require('neoscroll').setup({
				mappings = {
					'<C-y>', '<C-e>'
				},
				easing = linear,
				cursor_scrolls_alone = true,
				performance_mode = true,
				duration_multiplier = 0.4
			})
		end
	},
}
