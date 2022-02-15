if ! has('nvim-0.5')
	finish
endif

lua require'completion'.addCompletionSource('vimtex', require'vimtex'.complete_item)
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
autocmd BufEnter * lua require'completion'.on_attach()

let g:completion_chain_complete_list = {
            \ 'tex' : [
            \     {'complete_items': ['vimtex']},
            \   ],
            \ }
