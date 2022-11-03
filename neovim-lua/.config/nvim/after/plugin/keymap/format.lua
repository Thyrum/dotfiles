local Remap = require("thyrum.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap

nnoremap("<leader>f", ":Neoformat<CR>")

local augroup = vim.api.nvim_create_augroup
FormatGroup = augroup("Format", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
	group = cursorline_group,
	pattern = {'*.tex', '*.sty', '*.js', '*.ts'},
	callback = function() vim.cmd([[Neoformat]]) end,
})
