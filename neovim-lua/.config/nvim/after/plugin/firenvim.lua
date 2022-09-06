vim.cmd([[
	let g:firenvim_config = { 'globalSettings': { 'alt': 'all' }, 'localSettings': { '.*': { 'cmdline': 'firenvim', 'priority': 0, 'selector': 'textarea', 'takeover': 'never' }}}
	let fc = g:firenvim_config['localSettings']
	let fc['https?://github.com/'] = { 'takeover': 'always', 'priority': 1 }

	function! OnUIEnter(event) abort
		if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
			set laststatus=0
		endif
	endfunction
	autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
	au BufEnter github.com_*.txt set filetype=markdown
]])
