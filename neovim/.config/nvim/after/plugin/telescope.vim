if ! has('nvim-0.6.0')
	finish
endif

nnoremap <C-p> :lua require'telescope.builtin'.git_files{}<cr>
nnoremap <C-c> :lua require'telescope.builtin'.git_commits{}<cr>
nnoremap <leader>tg :lua require'telescope.builtin'.live_grep{}<cr>
