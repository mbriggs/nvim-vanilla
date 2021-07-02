local k = vim.keymap

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


k.nnoremap{ '<leader>.', ':Lspsaga lsp_finder<CR>' }
k.nnoremap{ 'ga', ':Lspsaga code_action<CR>' }
k.vnoremap{ 'ga', ':<C-U>Lspsaga range_code_action<CR>' }
k.nnoremap{ 'K', ':Lspsaga hover_doc<CR>' }
k.nnoremap{ 'gp', '<esc>:Lspsaga signature_help<CR>' }
k.nnoremap{ 'gr', ':Lspsaga rename<CR>' }
k.inoremap{ '<c-space>', function() require('lspsaga.signaturehelp').signature_help() end }


