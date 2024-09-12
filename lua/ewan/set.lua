
vim.opt.guicursor = ""

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir")

vim.opt.termguicolors = true
vim.g.mapleader = ","

vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

