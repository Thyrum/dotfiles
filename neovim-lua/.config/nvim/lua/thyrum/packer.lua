local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end


return require('packer').startup(function(use)
	use("wbthomason/packer.nvim")
	use("sbdchd/neoformat")

	use("nvim-lua/plenary.nvim") -- telescope dependency
	use("nvim-telescope/telescope.nvim")

	-- LSP stuffs
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")
	use {
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = 'hrsh7th/nvim-cmp'
	}
	use("onsails/lspkind-nvim")
	use("nvim-lua/lsp_extensions.nvim")
	--use("glepnir/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	use("mbbill/undotree")

	-- Colorscheme
	use("gruvbox-community/gruvbox")

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}

	-- git
	use("tpope/vim-fugitive")
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- indentation
	use("editorconfig/editorconfig-vim")

	-- LaTeX
	use("lervag/vimtex")

	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("glacambre/firenvim", {
		run = function() vim.fn['firenvim#install'](0) end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
