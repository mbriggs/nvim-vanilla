local k = vim.keymap
local wk = require'which-key'

require'lspsaga'.init_lsp_saga{
  finder_action_keys = {
    open = '<CR>', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  }
}


wk.register({
  ['<leader>.'] = { ':Lspsaga lsp_finder<CR>', 'Go To Definition' },
  ['g'] = {
    a = { ':Lspsaga code_action<CR>', 'Code Action' },
    k = { ':Lspsaga hover_doc<CR>', 'Hover Doc'  },
    p = { ':Lspsaga signature_help<CR>', 'Signature Help'  },
    r = { ':Lspsaga rename<CR>', 'Rename'  },
  }
})

k.vnoremap{ 'ga', ':<C-U>Lspsaga range_code_action<CR>' }
k.inoremap{ '<c-space>', function() require('lspsaga.signaturehelp').signature_help() end }

