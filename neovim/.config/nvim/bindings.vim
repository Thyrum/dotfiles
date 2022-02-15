"   ________
"  /_  __/ /_  __  _________  ______ ___
"   / / / __ \/ / / / ___/ / / / __ `__ \
"  / / / / / / /_/ / /  / /_/ / / / / / /
" /_/ /_/ /_/\__, /_/   \__,_/_/ /_/ /_/
"           /____/
"
" Filename:   .config/nvim/bindings.vim
" Github:     https://github.com/Thyrum/dotfiles
" Maintainer: Thyrum (Aron de Jong)

let mapleader=" "

" Toggle list variables
function! ToggleListChars()
	if &listchars == "tab:┆ " && &list
		set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
	elseif &listchars == "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨" && &list
		set nolist
	else
		set listchars=tab:┆\ 
		set list
	endif
endfunction

nnoremap <leader>l :call ToggleListChars()<cr>

" Movo to differnt window using ctrl-direction
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Disable relative numbmers, usefull for slow internet connections
nnoremap <leader>r :set relativenumber!<CR>

" Jump to the next TODO replacement marker
nnoremap <leader>; /<++><CR>c4l
nnoremap <leader>: ?<++><CR>c4l

" Yank to end of line, similair to D and C
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints on punctuation
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Add big jumps to jumplist too
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==a
inoremap <C-k> <esc>:m .-2<CR>==a
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Edit/source the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Open a terminal in a new window
if exists(':terminal')
	if has('nvim')
		nnoremap <leader>t :tabnew +:terminal<cr>
	else
		nnoremap <leader>t :tab terminal<cr>
	endif
endif

" Close quickfix and location list
nnoremap <c-w>e :cclose<cr>:lclose<cr>
