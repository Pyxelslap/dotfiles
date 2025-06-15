vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.redrawtime = 30000
vim.opt.synmaxcol = 200
vim.opt.scrolljump = 5
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2

-- keymap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- it's mean "\"
vim.keymap.set('n', '<C-t>', ':Neotree toggle filesystem reveal right<CR>', { silent = true, desc = "File Tree" })
vim.keymap.set('n', '<leader>ai', ':CodeCompanionChat Toggle<CR>', { silent = true, desc = "Chat Bot" })
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>', { desc = "Deselect search" })
vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-n>]], { desc = "Exit normal mode in terminal" })
vim.keymap.set('n', '<ScrollWheelUp>', 'k')
vim.keymap.set('n', '<ScrollWheelDown>', 'j')
vim.keymap.set('v', '<ScrollWheelUp>', 'k')
vim.keymap.set('v', '<ScrollWheelDown>', 'j')
vim.keymap.set("n", "<leader>cd", ":exec 'cd' . expand('%:p:h')<CR>", { silent = true, desc = "Change Neovim pwd" })

require('config.lazy')
