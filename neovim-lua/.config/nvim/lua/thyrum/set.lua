-- VISUAL {{{
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

-- }}}
-- INTERACTIVE {{{
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

-- }}} 
-- NDENTATION {{{
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.smartindent = true

--- }}}
-- FILES {{{
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Allow "@" as part of a filename
vim.opt.isfname:append("@-@")

-- }}}
