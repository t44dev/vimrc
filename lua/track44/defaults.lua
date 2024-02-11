-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Plugin/Command Ease of Access
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

-- Line Numbers
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.incsearch = true
