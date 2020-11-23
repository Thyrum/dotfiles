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

" Edit/source the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"=================
" Plugin Bindings
"=================

" YouCompleteMe
nnoremap <F9> :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

" Neoformat
nnoremap <leader>f :Neoformat<CR>
