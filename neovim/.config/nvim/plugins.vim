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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'tpope/vim-fugitive'

" Visuals
Plug 'tikhomirov/vim-glsl'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

" Indentation
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'
Plug 'Thyrum/vim-stabs'

" Undo's
Plug 'AndrewRadev/undoquit.vim'
Plug 'mbbill/undotree'

" LaTeX
Plug 'lervag/vimtex'
if has('python3')
	Plug 'sirver/ultisnips'
endif

" Easy surrounding with quotes
Plug 'tpope/vim-surround'

" Nvim in the browser
if has('nvim-0.4.0')
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

call plug#end()

"========
" Config
"========

" coc
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
let g:coc_global_extensions = ['coc-marketplace', 'coc-ultisnips', 'coc-vimtex']


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
set laststatus=2
set noshowmode

" EditorConfig

" Don't use editorconfig when editing fugitive buffers or going over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" vim-stabs
" Remove tab mapping to be able to use coc.nvim as well
let g:stabs_maps = 'boO='

" FZF
nnoremap <C-p> :GFiles<CR>

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = {
			\ 'build_dir' : 'build',
			\}
set conceallevel=1
let g:tex_conceal='abdmg'

" ultisnips
let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Fix problems with expanding and multiple cursors
function! Multiple_cursors_before()
    call youcompleteme#DisableCursorMovedAutocommands()
endfunction

function! Multiple_cursors_after()
    call youcompleteme#EnableCursorMovedAutocommands()
endfunction

" vim-glsl
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" firenvim
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://github.com/'] = { 'takeover': 'always', 'priority': 1 }
