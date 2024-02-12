let mapleader=" "

" VISUALS
"set relativenumber number
set listchars=tab:┆\  list
set showbreak=↪\  breakindent wrap
set colorcolumn=81,101
set shortmess+=c

augroup CursorLine
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * set cursorline
	autocmd WinLeave * set nocursorline
augroup END

augroup MyColors
	autocmd!
	autocmd ColorScheme * highlight ColorColumn ctermbg=236 guibg=#32302f
	autocmd ColorScheme * highlight CursorLineNr ctermfg=220 ctermbg=238 cterm=bold gui=bold
	autocmd ColorScheme * highlight CursorLine ctermbg=238 cterm=none gui=none
augroup END

if has('termguicolors')
	if ! has('nvim')
		" set Vim-specific sequences for RGB colors
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	set termguicolors
endif

colorscheme torte
set background=dark

syntax enable
filetype plugin indent on

" INTERACTIVE
set mouse=a
set splitbelow splitright
set scrolloff=2
set hlsearch incsearch
set noerrorbells
set clipboard=unnamedplus

" INDENTATION
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set smartindent

" FILES
set swapfile nobackup undofile
if ! has('nvim')
	set undodir='$HOME/.vim/undodir'
endif

set isfname+=@-@

" KEYMAPS
nnoremap <silent> <leader>j :m .+1<CR>==
nnoremap <silent> <leader>k :m .-2<CR>==
" Yank to the end of the line, similair to D and C
nnoremap <silent> Y y$

" Keeping it centered
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> J mzJ`z

" Add extra breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u


" PLUGINS

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'jszakmeister/vim-togglecursor'
Plug 'lervag/vimtex'
Plug 'sbdchd/neoformat'

if has('nvim')
	Plug 'lewis6991/gitsigns.nvim'
else
	Plug 'airblade/vim-gitgutter'
endif

call plug#end()

" togglecursor
if match($TERM, "color") >= 0
	let g:togglecursor_force = 'xterm'
endif
let g:togglecursor_leave = "line"

" fzf.vim
nnoremap <leader>rg :RG<cr>
nnoremap <leader>sf :Files<cr>
nnoremap <leader>sg :GFiles<cr>
nnoremap <leader>sg :Files<cr>

" vim-fugitive
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gs :G<cr>

" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
	\ 'aux_dir' : './build',
	\ 'out_dir' : './build',
	\ 'build_dir' : './build'
\}

" neoformat
nnoremap <leader>f :Neoformat<cr>

" gitsigns
if has('nvim')
	lua require('gitsigns').setup({
		\ signs = {
			\ add = { text = '+' },
			\ change = { text = '~' },
			\ delete = { text = '_' },
			\ topdelete = { text = '‾' },
			\ changedelete = { text = '~' },
		\}
	\})
endif
