return {
	{
		"gruvbox-community/gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ 'nvim-lualine/lualine.nvim' },
}
