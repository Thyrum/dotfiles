local function augroup(name)
	return vim.api.nvim_create_augroup("thyrum_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

local cursorline_group = augroup("CursorLine")
autocmd({"WinEnter", "VimEnter", "BufWinEnter"}, {
	group = cursorline_group,
	pattern = "*",
	callback = function() vim.opt_local.cursorline = true end,
})
autocmd("WinLeave", {
	group = cursorline_group,
	pattern = "*",
	callback = function() vim.opt_local.cursorline = false end,
})


autocmd("BufWritePre", {
	group = augroup("whitespace_remove"),
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
