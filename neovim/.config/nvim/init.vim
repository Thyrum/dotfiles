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

if exists(':lua')
	augroup highlight_yank
		autocmd!
		autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 50})
	augroup END
endif

" Hightlight column 81
set colorcolumn=81,101

syntax enable
filetype plugin indent on

if has('termguicolors')
	if ! has('nvim')
		" set Vim-specific sequences for RGB colors
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	set termguicolors
endif

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
set cinoptions=(s,us,Us,m1,g0,N-s,t0,:0


"====
" UI
"====
set number relativenumber
set mouse=a
set scrolloff=3
set showbreak=↪\ 
set nohlsearch
set incsearch
set foldmethod=syntax
set foldlevel=9999999
set splitbelow splitright
set hidden
call ToggleListChars()

"============================
" Filetype specific settings
"============================

augroup FiletypeSettings
	autocmd!

	"autocmd FileType text set cinoptions=u0,U0,g0,N-s,t0
	autocmd FileType text,markdown setlocal nocindent
	autocmd FileType text,markdown setlocal expandtab
	autocmd FileType text,markdown setlocal textwidth=80
	"autocmd FileType tex  setlocal expandtab
augroup END

"================
" Autocompletion
"================
set completeopt=menuone,noinsert,noselect

"======
" Misc
"======
set clipboard=unnamedplus
set nomodeline
let g:EditorConfig_verbose = 1
if exists(':terminal') && has('nvim')
	augroup Misc
		autocmd!
		autocmd TermOpen * startinsert
	augroup END
endif
