if ! has('nvim-0.5')
	finish
endif

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
