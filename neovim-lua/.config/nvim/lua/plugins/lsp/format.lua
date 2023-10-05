local Util = require("lazy.core.util")

local M = {}

M.custom_format = nil

function M.enabled()
	return M.opts.autoformat
end

function M.toggle()
	if vim.b.autoformat == false then
		vim.b.autoformat = nil
		M.opts.autoformat = true
	else
		M.opts.autoformat = not M.opts.autoformat
	end
end
