require('nvim-treesitter.configs').setup {
	ensure_installed = { "lua" },
	ignore_install = { "latex" },
	sync_install = false,
	auto_install = true,

	indent = { enable = true, disable = { 'python' } },

	highlight = {
		enable = true,
		disable = { "latex" },
		additional_vim_regex_highlighting = false,
	},
}
