local Remap = require("thyrum.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
	require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
	require('telescope.builtin').find_files()
end)
nnoremap("<Leader>pg", function()
	require('telescope.builtin').live_grep()
end)

nnoremap("<leader>pw", function()
	require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
	require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
	require('telescope.builtin').help_tags()
end)

-- TODO: Fix this immediately
nnoremap("<leader>vwh", function()
	require('telescope.builtin').help_tags()
end)

nnoremap("<leader>gw", function()
	require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
	require('telescope').extensions.git_worktree.create_git_worktree()
end)

nnoremap("<leader>vrc", function()
	require('thyrum.telescope').search_dotfiles()
end)
