return {
	{
		"gruvbox-community/gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
			vim.g.gruvbox_contrast_dark = "hard"
			vim.g.gruvbox_invert_selection = true
			vim.opt.background = "dark"

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
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lualine/lualine.nvim" },
}
