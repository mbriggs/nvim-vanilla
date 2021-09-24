require'astronauta.keymap'
local k = vim.keymap
local wk =  require('which-key')

wk.register({
  ['<leader><leader>'] = { '<c-^>', 'Jump to Previous File' }
})

-- enter clears hlsearch
k.nnoremap{ '<CR>', ':nohlsearch<CR>:w<CR>' }

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
k.nnoremap{ ']<space>', 'mbo<esc>^d$`b' }

-- blank line above
k.nnoremap{ '[<space>', 'mbO<esc>^d$`b' }
