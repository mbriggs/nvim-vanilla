local wk = require('which-key')

wk.register({
  ["<leader>e"] = {
    r = { '<cmd>SudaRead<cr>', 'Read file with sudo' },
    w = { '<cmd>SudaWrite<cr>', 'Write file with sudo' },
  }
})
