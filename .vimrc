" vim-plug setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug plugin list
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'

" For markdown plugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

" Lightline settings
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

" YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'info'
map <F9> :YcmCompleter FixIt<CR>
let g:ycm_always_populate_location_list = 1



" Lightline settings
if $TERM !=? 'linux'
  set laststatus=2
  set noshowmode
else
  call lightline#disable()
endif


" General settings
set mouse=a
set number relativenumber
set cindent
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
set hlsearch " Highlight all search querys
colorscheme ron

" Set public/private/protected indentation to how i like it
set cinoptions=g0

" Map the caps lock key to escape
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Leader keys mapping
let mapleader = ' '
map <Leader>l :w<CR> :!if [ "%:t:e" = "tex" ]; then pdflatex % && pkill mupdf --signal SIGHUP; fi<CR><CR>
map <Leader>c :w<CR> :!if [ "%:t:e" = "md" ]; then pandoc % > %.html; fi<CR>
