set laststatus=2
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'fugitive', 'readonly', 'filename', 'modified'] ]
			\ },
			\ 'component_function': {
			\   'fugitive': 'FugitiveHead',
			\ },
			\ }
set laststatus=2
set noshowmode
