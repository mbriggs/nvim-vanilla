local wk = require('which-key')

wk.register({
  ['<leader>;'] = { [[<cmd>Telescope find_files<cr>]], 'Find File' },
  ['<leader>f'] = {
    name = '+find',
    f = { [[<cmd>Telescope live_grep<cr>]], 'Live Grep' },
    h = { [[<cmd>Telescope help_tags<cr>]], 'Help Tag' },
    e = { [[<cmd>Telescope buffers<cr>]], 'Buffers' },
    [';'] = { [[<cmd>Telescope commands<cr>]], 'Commands' },
    k = { [[<cmd>Telescope keymaps<cr>]], 'Keymap' },
    t = { [[<cmd>Telescope filetypes<cr>]], 'Filetypes' },
    d = { [[<cmd>Telescope lsp_workspace_diagnostics<cr>]], 'Workspace Diagnostics' },
  },
  ['<leader>m'] = {
    name = '+symbols',
    m = { [[<cmd>Telescope lsp_document_symbols<cr>]], 'Document Symbols' },
    w = { [[<cmd>Telescope lsp_dynamic_workspace_symbols<cr>]], 'Workspace Symbols' },
  },
  ['<leader>g'] = {
    name = '+git',
    g = { [[<cmd>Telescope git_branches<cr>]], 'Git Branches' },
    c = { [[<cmd>Telescope git_bcommits<cr>]], 'Git Commits' },
    s = { [[<cmd>Telescope git_status<cr>]], 'Git Status' },
  }
})

