"   ________
"  /_  __/ /_  __  _________  ______ ___
"   / / / __ \/ / / / ___/ / / / __ `__ \
"  / / / / / / /_/ / /  / /_/ / / / / / /
" /_/ /_/ /_/\__, /_/   \__,_/_/ /_/ /_/
"           /____/
"
" Filename:   .config/nvim/init.vim
" Github:     https://github.com/Thyrum/dotfiles
" Maintainer: Thyrum (Aron de Jong)

" Load other modules
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/bindings.vim


"========
" Colors
"========
augroup MyColors
	autocmd!
	autocmd ColorScheme * highlight ColorColumn ctermbg=235 guibg=#282924
	autocmd ColorScheme * highlight LineNr ctermfg=238 cterm=none
	autocmd ColorScheme * highlight CursorLineNr ctermfg=220 ctermbg=238 cterm=bold
	autocmd ColorScheme * highlight CursorLine ctermbg=238 cterm=none
augroup END

augroup CursorLine
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

" Hightlight everything after column 80
let &colorcolumn="81,".join(range(121,9999),",")

syntax enable
filetype plugin indent on
colorscheme ron

"===========================
" Indentation and alignment
"===========================
set noexpandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2
set smarttab 
set cindent
set cinoptions=(0,u0,U0,g0,N-s,t0

autocmd FileType text set cinoptions=u0,U0,g0,N-s,t0


"====
" UI
"====
set number relativenumber
set mouse=a
set scrolloff=3
set showbreak=↪\ 
set hlsearch
set foldmethod=syntax
set foldlevel=9999999
set splitbelow splitright

set listchars=tab:┆\ 
set list

"======
" Misc
"======
set clipboard=unnamedplus
set nomodeline
"autocmd BufWritePost *.tex silent exec "!pdflatex %"
