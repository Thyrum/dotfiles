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
if has('nvim-0.6.0')
	Plug 'nvim-lua/plenary.nvim' " telescope dependency
	Plug 'nvim-telescope/telescope.nvim'
else
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
endif

" Autocompletion and linting
if has('nvim-0.5')
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
else
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif


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

" General languages
Plug 'lepture/vim-jinja'

" tmux integration
Plug 'preservim/vimux'

call plug#end()
