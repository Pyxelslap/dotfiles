return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')
			-- dap.adapters.php = {
			-- 	type = 'executable',
			-- 	command = 'node',
			-- }
			-- dap.configurations.php = {
			-- 	{
			-- 		type = 'php',
			-- 		request = 'launch',
			-- 		name = 'Listen for Xdebug',
			-- 		port = 9003
			-- 	}
			-- }
			--
			vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>")
			vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>")
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "jay-babu/mason-nvim-dap.nvim" },
		config = function()
			require('dapui').setup()
			require("mason-nvim-dap").setup({
				handlers = {
					function(config)
						require('mason-nvim-dap').default_setup(config)
					end
				}
			})

			--
			vim.keymap.set('n', '<leader>d', ":lua require('dapui').toggle()<CR>")
		end
	}
}
