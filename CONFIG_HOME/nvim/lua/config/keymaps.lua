-- nvim keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- it's mean "\"
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>', { desc = "Deselect search" })
vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-n>]], { desc = "Exit normal mode in terminal" })
vim.keymap.set("n", "<leader>.", ":exec 'cd ' . expand('%:p:h') | pwd<CR>",
	{ silent = true, desc = "Change Neovim PWD" })

-- Touch Screen navigation
vim.keymap.set('n', '<ScrollWheelUp>', 'k')
vim.keymap.set('n', '<ScrollWheelDown>', 'j')
vim.keymap.set('v', '<ScrollWheelUp>', 'k')
vim.keymap.set('v', '<ScrollWheelDown>', 'j')

-- Neotree
vim.keymap.set('n', '<C-t>', ':Neotree toggle last reveal right<CR>', { silent = true, desc = "File Tree" })
vim.keymap.set('n', '<ScrollWheelLeft>', ':Neotree toggle filesystem reveal right<CR>',
	{ silent = true, desc = "File Tree" })

-- AI
vim.keymap.set('n', '<leader>ai', ':CodeCompanionChat Toggle<CR>', { silent = true, desc = "Chat Bot" })

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>',
	{ silent = true, desc = "Open Terminal in floating window" })
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<CR>', { silent = true, desc = "Open Terminal in new tab" })
vim.keymap.set('n', '<leader>tl', ':ToggleTerm direction=vertical size=25<CR>',
	{ silent = true, desc = "Open Terminal in side panel" })
vim.keymap.set('n', '<leader>tj', ':ToggleTerm direction=horizontal<CR>',
	{ silent = true, desc = "Open Terminal in bottom panel" })

-- LSP
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set('n', '<leader>el', vim.diagnostic.setqflist, { desc = "Error list" })
