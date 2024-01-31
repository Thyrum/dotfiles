" VISUALS
set relativenumber number
set listchars=tab:┆\  list
set showbreak=↪\  breakindent wrap
set colorcolumn=81,101
set shortmess+=c

" Block cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

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
set scrolloff=3
set hlsearch incsearch
set noerrorbells
set clipboard=unnamedplus
let mapleader=" "

" INDENTATION
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set smartindent

" FILES
set swapfile nobackup undodir='$HOME/.vim/undodir' undofile

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
