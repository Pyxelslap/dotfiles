return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require('lint').linters_by_ft = {
				go = { 'revive' },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end
	},
	{
		"rshkarin/mason-nvim-lint",
		config = function()
			require("mason-nvim-lint").setup(
				{
					ensure_installed = {},
					ignore_install = {},
					quiet_mode = false,
				}
			)
		end
	}
}
