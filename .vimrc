let mapleader = ' '

" ============================
" ===== augroup commands =====
" ============================

augroup MyColors
	autocmd!
	autocmd ColorScheme * highlight ColorColumn ctermbg=235 guibg=#2c2d27
augroup END

" ==========================
" ===== Vim-plug setup =====
" ==========================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Enable filetype specific plugins
filetype plugin indent on

" Vim-plug plugin list
call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}

Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'
call plug#end()

" ===========================
" ===== Plugin settings =====
" ===========================

" Lightline settings
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

" YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'info'
let g:ycm_always_populate_location_list = 1

" Lightline settings
if $TERM !=? 'linux'
  set laststatus=2
  set noshowmode
else
  call lightline#disable()
endif

" ============================
" ===== General settings =====
" ============================

set mouse=a
set number relativenumber
set noexpandtab softtabstop=0 shiftwidth=2 tabstop=2 smarttab 
" indent with spaces for alignment
set cindent
set cinoptions=(0,u0,U0,g0,N-s
set hlsearch " Highlight all search querys
set scrolloff=3
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
colorscheme ron
" Hightlight everything after column 80
let &colorcolumn="80,".join(range(120,999),",")


" ===============================
" ===== Custom key mappings =====
" ===============================

" Disable relative numbmers, usefull for slow internet connections
nnoremap <leader>r :set relativenumber!<CR>

" Replace variables/words
nnoremap gr gd[{V%:s/<C-R>///gc<Left><Left><Left>
nnoremap gR gD:%s/<C-R>///gc<Left><Left><Left>

" Toggle list variables
nnoremap <leader>l :set list!<cr>
" Edit/source the vimrc
nnoremap <leader>ev :split ~/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" YouCompleteMe key maps
nnoremap <F9> :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

" NERDTree key maps
nnoremap <c-n> :NERDTreeToggle<CR>
