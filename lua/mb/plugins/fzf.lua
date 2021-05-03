vim.cmd('let $FZF_DEFAULT_COMMAND = \'rg --files --hidden --follow --glob "!.git/*"\'')

vim.cmd('autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>')

nnoremap('<leader>;', ':call fzf#vim#files(\'.\', {\'options\': \'--prompt "  " --no-preview --exact\'})<CR>')
nnoremap('E', ':call fzf#vim#buffers(\'.\', {\'options\': \'--prompt "  " --no-preview --exact\'})<CR>')
nnoremap('<leader>:', ':Commands<CR>')
nnoremap('<leader>?', ':History<CR>')
tnoremap('<m-p>', '<up>')
tnoremap('<m-n>', '<down>')
