nnoremap <leader>f  :Neoformat<CR>
nnoremap <leader>nf :autocmd! Format<CR>

let g:neoformat_tex_latexindent = {
  \ 'exe': 'latexindent',
  \ 'args': ['-l'],
  \ 'stdin': 1
  \ }

augroup Format
	autocmd!
	autocmd BufWritePre *.tex Neoformat
augroup END
