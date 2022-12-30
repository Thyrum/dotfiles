require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

require('telescope').load_extension('git_worktree')

local Remap = require("thyrum.keymap")
local nnoremap = Remap.nnoremap

nnoremap('<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nnoremap('<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
nnoremap('<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch [W]ord' })
nnoremap('<leader>ss', function () require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")}) end, { desc = '[S]earch [S]tring' })
nnoremap('<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch [G]rep' })
nnoremap('<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

nnoremap('<C-p>', require('telescope.builtin').git_files)
nnoremap('<leader>gw', require('telescope').extensions.git_worktree.git_worktrees, { desc = '[G]it [W]orktree' })
