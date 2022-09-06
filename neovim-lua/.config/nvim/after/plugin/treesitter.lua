require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	ignore_install = { "latex" },
	sync_install = false,

	highlight = {
		enable = true,
		disable = { "latex" },
		additional_vim_regex_highlighting = false,
	},
}
