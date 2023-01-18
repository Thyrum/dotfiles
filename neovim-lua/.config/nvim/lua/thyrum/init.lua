require("thyrum.set")
require("thyrum.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local cursorline_group = augroup('CursorLine', {})
autocmd({'VimEnter', 'WinEnter', 'BufWinEnter'}, {
	group = cursorline_group,
	pattern = '*',
	callback = function() vim.opt_local.cursorline = true end,
})
autocmd('WinLeave', {
	group = cursorline_group,
	pattern = '*',
	callback = function() vim.opt_local.cursorline = false end,
})

function R(name)
	require("plenary.reload").reaload_module(name)
end

local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

ThyrumGroup = augroup('Thyrum', {})
autocmd({"BufWritePre"}, {
	group = ThyrumGroup,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
