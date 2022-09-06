vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showbreak= "↪ "
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.listchars = "tab:┆ "
vim.opt.list = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.errorbells = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 3
vim.opt.isfname:append("@-@")

vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "81,101"

vim.g.mapleader = " "
