local wk = require('which-key')

wk.register({
  ['<leader>c'] = {
    r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename Variable'},
    i = { '<cmd>lua vim.lsp.buf.hover()()<cr>', 'Info (hover)'},
  }
})

