local wk = require('which-key')

wk.register({
  ['<leader>'] = {
    [';'] = { [[<cmd>Telescope find_files<cr>]], 'Find File' },
    [':'] = { [[<cmd>Telescope oldfiles<cr>]], 'Find Old File' },
    ["'"] = { [[<cmd>Telescope resume<cr>]], 'Reopen Last Picker' },
    ['.'] = { [[<cmd>Telescope lsp_definitions<cr>]], 'Go to Definition' },

    f = {
      name = '+find',
      b = { [[<cmd>Telescope current_buffer_fuzzy_find<cr>]], 'Find within buffer' },
      r = { [[<cmd>Telescope lsp_references<cr>]], 'Find References' },
      i = { [[<cmd>Telescope lsp_implementations<cr>]], 'Find Implementations' },
      f = { [[<cmd>Telescope live_grep<cr>]], 'Live Grep' },
      t = { [[<cmd>Telescope filetypes<cr>]], 'Filetypes' },
      s = { [[<cmd>Telescope search_history<cr>]], 'Previous Searches' },
    },

    o = {
      name = '+open',
      g = { [[<cmd>Telescope git_files<cr>]], 'Git Files' },
      f = { [[<cmd>Telescope find_files<cr>]], 'Find File' },
    },

    c = {
      name = "+code",
      d = { [[<cmd>Telescope lsp_document_diagnostics<cr>]], 'Document Diagnostics' },
      w = { [[<cmd>Telescope lsp_workspace_diagnostics<cr>]], 'Workspace Diagnostics' },
    },

    e = {
      name = "+editor",
      b = { [[<cmd>Telescope buffers<cr>]], 'Switch Buffer' },
      m = { [[<cmd>Telescope marks<cr>]], 'Marks' },
      h = { [[<cmd>Telescope help_tags<cr>]], 'Help Tag' },
      [';'] = { [[<cmd>Telescope commands<cr>]], 'Commands' },
      c = { [[<cmd>Telescope command_history<cr>]], 'Previous Commands' },
      k = { [[<cmd>Telescope keymaps<cr>]], 'Keymap' },
      q = { [[<cmd>Telescope quickfix<cr>]], 'QuickFix' },
      o = { [[<cmd>Telescope quickfix<cr>]], 'Vim Options' },
    },

    m = {
      name = '+symbols',
      m = { [[<cmd>Telescope lsp_document_symbols<cr>]], 'Document Symbols' },
      w = { [[<cmd>Telescope lsp_dynamic_workspace_symbols<cr>]], 'Workspace Symbols' },
    },

    g = {
      name = '+git',
      g = { [[<cmd>Telescope git_branches<cr>]], 'Git Branches' },
      c = { [[<cmd>Telescope git_bcommits<cr>]], 'Git Commits' },
      s = { [[<cmd>Telescope git_status<cr>]], 'Git Status' },
      t = { [[<cmd>Telescope git_stash<cr>]], 'Git Stashes' },
    }
  }
})

