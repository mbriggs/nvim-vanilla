-- enter clears hlsearch
nnoremap('<CR>', ':nohlsearch<CR>:wa<CR>')

-- toggle last file
nnoremap('<leader><leader>', '<c-^>')

-- quick reload configs
nmap('<Leader>so', '<esc>:luafile ~/.config/nvim/init.lua')

-- dupe stuff
vmap('<c-d>', 'mby`bp`bgv')
nmap('<c-d>', 'mpyyp`p')

-- qf
nmap('<c-n>', ':cn<cr>')
nmap('<c-p>', ':cp<cr>')

-- who needs loads of macro registers?
nnoremap('Q', '@q')

-- jump to matching pair
nnoremap('<Leader>m', '%')

-- %% for current dir
cnoremap('%%', '<C-R>=expand(\'%:h\').\'/\'<cr>')

-- front and back of a line
nnoremap('<s-h>', '^')
nnoremap('<s-l>', '$')

-- why isn't it this by default??
nnoremap('<s-y>', 'y$')
