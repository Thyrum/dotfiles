local Util = require("config.util")

return {
	{
		"nvim-telescope/telescope.nvim",
		commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
		cmd = "Telescope",
		version = false, -- telescope did only one release, so use HEAD for now
		dependencies = { { "nvim-lua/plenary.nvim" } },
		keys = {
			{ "<C-p>", Util.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>rg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		}
	},
	{
		"tpope/vim-fugitive",
		event = {"BufReadPre", "BufNewFile" },
		keys = {
		{ "<leader>gj", ":diffget //3<cr>", desc = "Select the right diff"},
		{ "<leader>gf", ":diffget //2<cr>", desc = "Select the left diff"},
		{ "<leader>gs", ":G<cr>", desc = "[G]it [S]tatus"},
		},
	}
}
