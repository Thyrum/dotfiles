-- visual
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.listchars = "tab:┆ "
vim.opt.list = true

vim.opt.showbreak= "↪ "
vim.opt.breakindent = true
vim.opt.wrap = true

vim.opt.termguicolors = true
vim.opt.colorcolumn = "81,101"

vim.opt.shortmess:append("c")

-- interactive
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 3

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.errorbells = false

vim.g.mapleader = " "

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"


-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.smartindent = true

-- files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.isfname:append("@-@")
