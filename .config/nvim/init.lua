-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic options
vim.o.termguicolors = true
vim.cmd [[colorscheme slate]]
vim.o.number = true
vim.o.mouse = ""
vim.opt.iskeyword:append("-")

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Files
vim.opt.backup = true
vim.opt.swapfile = true
vim.opt.undofile = true

vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup"
vim.opt.directory = vim.fn.stdpath("data") .. "/swap"
vim.opt.undodir  = vim.fn.stdpath("data") .. "/undo"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
