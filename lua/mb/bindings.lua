require'astronauta.keymap'
local k = vim.keymap

-- enter clears hlsearch
k.nnoremap{ '<CR>', ':nohlsearch<CR>:w<CR>' }

-- toggle last file
k.nnoremap{ '<leader><leader>', '<c-^>' }

-- quick reload configs
k.nmap{ '<Leader>so', '<esc>:luafile ~/.config/nvim/init.lua' }

-- dupe stuff
k.vmap{ '<c-d>', 'mby`bp`bgv' }
k.nmap{ '<c-d>', 'mpyyp`p' }

 -- qf
k.nmap{ '<c-n>', ':cn<cr>' }
k.nmap{ '<c-p>', ':cp<cr>' }

-- who needs loads of macro registers?
k.nnoremap{ 'Q', '@q' }

-- %% for current dir
k.cnoremap{ '%%', '<C-R>=expand(\'%:h\').\'/\'<cr>' }

-- front and back of a line
k.nnoremap{ '<s-h>', '^' }
k.nnoremap{ '<s-l>', '$' }

-- why isn't it this by default??
k.nnoremap{ '<s-y>', 'y$' }

-- blank line below
k.nnoremap{ 'g<space>', 'mbo<esc>^d$`b' }
