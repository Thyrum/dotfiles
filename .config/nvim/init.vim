set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" Vim-plug plugin list
"call plug#begin('~/.vim/plugged')
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'itchyny/lightline.vim'
"call plug#end()
"
"" Lightline settings
"if has('gui_running')
"   set laststatus=2
"   set noshowmode
"endif
"
"
"" General settings
"set mouse=a
"set number
"set cindent
"set tabstop=8 softtabstop=0 expandtab shiftwidth=3 smarttab
"set hlsearch " Enable highlight for all search querys
"colorscheme ron
