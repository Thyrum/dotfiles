local Util = require("thyrum.util")

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
}
