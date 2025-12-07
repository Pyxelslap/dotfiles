-- nvim keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- it's mean "\"
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>', { desc = "Deselect search" })
vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-n>]], { desc = "Exit normal mode in terminal" })
vim.keymap.set("n", "<leader>.", ":exec 'cd ' . expand('%:p:h') | pwd<CR>",
	{ silent = true, desc = "Change Neovim pwd" })

-- Right Panels
vim.keymap.set('n', '<C-t>', ':Neotree toggle last reveal right<CR>', { silent = true, desc = "File Tree" })
vim.keymap.set('n', '<ScrollWheelLeft>', ':Neotree toggle filesystem reveal right<CR>',
	{ silent = true, desc = "File Tree" })

-- Pop Ups
vim.keymap.set('n', '<leader>ai', ':CodeCompanionChat Toggle<CR>', { silent = true, desc = "Chat Bot" })

-- Touch Screen navigation
vim.keymap.set('n', '<ScrollWheelUp>', 'k')
vim.keymap.set('n', '<ScrollWheelDown>', 'j')
vim.keymap.set('v', '<ScrollWheelUp>', 'k')
vim.keymap.set('v', '<ScrollWheelDown>', 'j')

-- LSP
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set('n', '<leader>el', vim.diagnostic.setqflist, { desc = "Error list" })
