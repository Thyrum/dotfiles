"   ________
"  /_  __/ /_  __  _________  ______ ___
"   / / / __ \/ / / / ___/ / / / __ `__ \
"  / / / / / / /_/ / /  / /_/ / / / / / /
" /_/ /_/ /_/\__, /_/   \__,_/_/ /_/ /_/
"           /____/
"
" Filename:   .config/nvim/plugins.vim
" Github:     https://github.com/Thyrum/dotfiles
" Maintainer: Thyrum (Aron de Jong)

"=========
" Plugins
" ========
if has('nvim')
	if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
		echo "Downloading junegunn/vim-plug to manage plugins..."
		silent !mkdir -p ~/.config/nvim/autoload/
		silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
		autocmd VimEnter * PlugInstall
	endif
else
	if ! filereadable(expand('~/.vim/autoload/plug.vim'))
		echo "Downloading junegunn/vim-plug to manage plugins..."
		silent !mkdir -p ~/.vim/autoload
		silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
		autocmd VimEnter * PlugInstall
	endif
endif


" Vim-plug plugin list
call plug#begin()

" File management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Auto-completion
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'Valloric/YouCompleteMe'

" git
Plug 'tpope/vim-fugitive'

" Visuals
"Plug 'thaerkh/vim-indentguides'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'

" Indentation
Plug 'editorconfig/editorconfig-vim'
Plug 'dpc/vim-smarttabs'

" Undo's
Plug 'AndrewRadev/undoquit.vim'
Plug 'mbbill/undotree'

" LaTeX
Plug 'lervag/vimtex'

" Fun
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()

"========
" Config
"========

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'info'
let g:ycm_always_populate_location_list = 1

" LightLine
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

" EditorConfig

" Don't use editorconfig when editing fugitive buffers or going over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" FZF
nnoremap <C-p> :GFiles<CR>

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
			\ 'build_dir' : 'build',
			\}
