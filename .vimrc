let mapleader = ' '

" vim-plug setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug plugin list
call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

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

" NERDTree settings
nnoremap <c-n> :NERDTreeToggle<CR>


" General settings
set mouse=a
set number relativenumber
set cindent
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
set hlsearch " Highlight all search querys
set scrolloff=3
colorscheme ron
" Hightlight everything after column 80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27


" Set public/private/protected indentation to how i like it
set cinoptions=g0

" Replace variables/words
nnoremap gr gd[{V%:s/<C-R>///gc<Left><Left><Left>
nnoremap gR gD:%s/<C-R>///gc<Left><Left><Left>

" Make the current word uppercase
inoremap <c-u> <esc>viwUea
" Surround the current word in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Leader keys mapping
map <leader>l :w<CR> :!if [ "%:t:e" = "tex" ]; then pdflatex % && pkill mupdf --signal SIGHUP; fi<CR><CR>
map <leader>c :w<CR> :!if [ "%:t:e" = "md" ]; then pandoc % > %.html; fi<CR>

" Edit/source the vimrc
nnoremap <leader>ev :split ~/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
