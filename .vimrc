"   ________
"  /_  __/ /_  __  _________  ______ ___
"   / / / __ \/ / / / ___/ / / / __ `__ \
"  / / / / / / /_/ / /  / /_/ / / / / / /
" /_/ /_/ /_/\__, /_/   \__,_/_/ /_/ /_/
"           /____/
"
" Filename:   .vimrc
" Github:     https://github.com/Thyrum/dotfiles
" Maintainer: Thyrum (Aron de Jong)

" Plugins {{{


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug plugin list
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'dpc/vim-smarttabs'

call plug#end()


" }}}

" Colors {{{


augroup MyColors
	autocmd!
	autocmd ColorScheme * highlight ColorColumn ctermbg=235 guibg=#2c2d27
augroup END

syntax enable
filetype plugin indent on
colorscheme ron


" }}}

" Indentation and alignment {{{


set noexpandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2
set smarttab 
set cindent
set cinoptions=(0,u0,U0,g0,N-s,t0


" }}}

" UI {{{


let mapleader=" "
set modeline
set number relativenumber
set cursorline
set mouse=a
set hlsearch
set scrolloff=3
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set hlsearch
set foldmethod=syntax
set foldlevel=9999999

" Split to the right or below by default
set splitbelow splitright

" Movo to differnt window using ctrl-direction
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Hightlight everything after column 80
let &colorcolumn="80,".join(range(120,999),",")

" Disable relative numbmers, usefull for slow internet connections
nnoremap <leader>r :set relativenumber!<CR>
" Toggle list variables
nnoremap <leader>l :set list!<cr>

inoremap <buffer> ;; <C-O>/<++><CR><C-O>c4l
nnoremap <buffer> ;; /<++><CR>c4l


" }}}

" VIMRC {{{


" Edit/source the vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<cr>


" }}}

" YouCompleteMe {{{


let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'info'
let g:ycm_always_populate_location_list = 1

nnoremap <F9> :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>


" }}}

" LightLine {{{


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
if $TERM !=? 'linux'
  set laststatus=2
  set noshowmode
else
  call lightline#disable()
endif


" }}}

" NERDTree {{{


nnoremap <c-n> :NERDTreeToggle<CR>


" }}}

" EditorConfig {{{


" Don't use editorconfig when editing fugitive buffers or going over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" }}}

" tex files {{{
autocmd BufWritePost *.tex silent exec "!pdflatex %"

" }}}

" vim: foldmethod=marker:foldlevel=0
