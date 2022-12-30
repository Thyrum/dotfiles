local Remap = require("thyrum.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap

nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Disable relative numbmers, usefull for slow internet connections
nnoremap("<leader>re", function() vim.opt.relativenumber = not vim.opt.relativenumber:get() end)

-- Jump to the next TODO replacement marker
nnoremap("<leader>;", "/<++><CR>c4l")
nnoremap("<leader>:", "?<++><CR>c4l")

-- Yank to end of line, similair to D and C
nnoremap("Y", "y$")

-- Keeping it centered
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- Undo breakpoints on punctuation
inoremap(",", ",<C-g>u")
inoremap(".", ".<C-g>u")
inoremap("!", "!<C-g>u")
inoremap("?", "?<C-g>u")

-- Add big jumps to jumplist too
nnoremap("k",  "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'", { expr = true })
nnoremap("j",  "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'", { expr = true })

-- Moving text
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
inoremap("<C-j>", "<esc>:m .+1<CR>==a")
inoremap("<C-k>", "<esc>:m .-2<CR>==a")
nnoremap("<leader>j", ":m .+1<CR>==")
nnoremap("<leader>k", ":m .-2<CR>==")
