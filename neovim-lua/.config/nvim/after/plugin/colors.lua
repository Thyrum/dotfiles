vim.g.thyrum_colorscheme = 'gruvbox'

function SetColors()
	vim.g.gruvbox_contrast_dark = 'hard'
	vim.g.gruvbox_invert_selection = true
	vim.opt.background = "dark"

	vim.cmd("colorscheme " .. vim.g.thyrum_colorscheme)

	local hl = function(thing, opts)
		vim.api.nvim_set_hl(0, thing, opts)
	end


	hl("SignColumn", {
		bg = "none",
	})

	hl("ColorColumn", {
		ctermbg = 0,
		bg = "#555555",
	})

	hl("CursorLineNR", {
		bg = "none"
	})

	hl("Normal", {
		bg = "none"
	})

	hl("LineNr", {
		fg = "#5eacd3"
	})

	hl("netrwDir", {
		fg = "#5eacd3"
	})
end

SetColors()
