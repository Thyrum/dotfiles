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
	autocmd ColorScheme * highlight ColorColumn ctermbg=236 guibg=#32302f
	autocmd ColorScheme * highlight CursorLineNr ctermfg=220 ctermbg=238 cterm=bold gui=bold
	autocmd ColorScheme * highlight CursorLine ctermbg=238 cterm=none gui=none
augroup END

augroup CursorLine
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

"augroup LuaHighlight
"  au!
"  au TextYankPost * lua vim.highlight.on_yank { higroup = "Substitute", timeout = 150, on_macro = true }
"augroup END

" Hightlight column 81
set colorcolumn=81

syntax enable
filetype plugin indent on

set termguicolors
set background=dark
colorscheme gruvbox

"===========================
" Indentation and alignment
"===========================
set noexpandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2
set smarttab 
set smartindent
set cindent
set cinoptions=(0,u0,U0,g0,N-s,t0


"====
" UI
"====
set number relativenumber
set mouse=a
set scrolloff=3
set showbreak=↪\ 
set hlsearch
set incsearch
set foldmethod=syntax
set foldlevel=9999999
set splitbelow splitright

set listchars=tab:┆\ 
set list

"============================
" Filetype specific settings
"============================

augroup FiletypeSettings
	autocmd!

	"autocmd FileType text set cinoptions=u0,U0,g0,N-s,t0
	autocmd FileType text setlocal nocindent
	autocmd FileType text setlocal expandtab
	autocmd FileType text setlocal textwidth=80
augroup END

"======
" Misc
"======
set clipboard=unnamedplus
set nomodeline
"autocmd BufWritePost *.tex silent exec "!pdflatex %"
"
let g:EditorConfig_verbose = 1