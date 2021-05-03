require'lspsaga'.init_lsp_saga{
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  }
}


nnoremap('<leader>.', ':Lspsaga lsp_finder<CR>')
nnoremap('ga', ':Lspsaga code_action<CR>')
vnoremap('ga', ':<C-U>Lspsaga range_code_action<CR>')
nnoremap('K', ':Lspsaga hover_doc<CR>')
nnoremap('gp', '<esc>:Lspsaga signature_help<CR>')
nnoremap('gr', ':Lspsaga rename<CR>')
