if ! has('nvim-0.5')
	finish
endif

nnoremap <C-p> :lua require'telescope.builtin'.git_files{}<cr>
nnoremap <C-c> :lua require'telescope.builtin'.git_commits{}<cr>
