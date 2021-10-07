local wk = require("which-key")
local dap = require'dap'
local gl = require'gitlinker'
local gla = require'gitlinker.actions'

wk.register({
  ['<leader>'] = {
    [';'] = { [[<cmd>Telescope find_files<cr>]], 'Find File' },
    [':'] = { [[<cmd>Telescope oldfiles<cr>]], 'Find Old File' },
    ["'"] = { [[<cmd>Telescope resume<cr>]], 'Reopen Last Picker' },
    ['.'] = { [[<cmd>Telescope lsp_definitions<cr>]], 'Go to Definition' },

    b = {
      name = '+tree',
      b = { ':NvimTreeToggle<CR>', 'Toggle Tree' },
      r = { ':NvimTreeRefresh<CR>', 'Refresh Tree' },
      f = { ':NvimTreeFindFile<CR>', 'Find Current File In Tree' },
    },

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
      c = { '<cmd>CodeActionMenu<cr>', 'Code Actions' }
    },

    d = {
      name = '+debug',
      d = { function() dap.toggle_breakpoint() end, 'Toggle Breakpoint' },
      b = { function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, 'Toggle Breakpoint Condition' },
      l = { function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end , 'Toggle Log Point' },
      c = { function() dap.continue() end, 'Continue' },
      o = { function() dap.step_over() end, 'Step Over (c-j)' },
      i = { function() dap.step_over() end, 'Step Into (c-k)' },
      t = { function() dap.step_over() end, 'Step Out (c-l)' },
      r = { function() dap.repl.open() end, 'Open REPL' },
      R = { function() dap.run_last() end, 'Run Last Configuration' },
      k = { function() require('dap.ui.variables').hover() end, 'Show Hover Information'}
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
      r = { '<cmd>SudaRead<cr>', 'Read file with sudo' },
      w = { '<cmd>SudaWrite<cr>', 'Write file with sudo' },
      s = { '<cmd>PackerSync<cr>', 'Sync Plugins' },
    },

    m = {
      name = '+symbols',
      m = { [[<cmd>Telescope lsp_document_symbols<cr>]], 'Document Symbols' },
      w = { [[<cmd>Telescope lsp_dynamic_workspace_symbols<cr>]], 'Workspace Symbols' },
    },

    g = {
      name = '+git',
      c = { [[<cmd>Telescope git_bcommits<cr>]], 'Git Commits' },
      s = { [[<cmd>Telescope git_status<cr>]], 'Git Status' },
      t = { [[<cmd>Telescope git_stash<cr>]], 'Git Stashes' },
      g = { [[<cmd>LazyGit<cr>]], 'LazyGit' },
      b = { [[<cmd>GitMessenger<cr>]], 'Blame' },
      l = {
        function()
          gl.get_buf_range_url("n", {
            action_callback = gla.open_in_browser
          })
        end, 'Web Link', silent = true
      },
      L = {
        function()
          gl.get_buf_range_url("v", {
            action_callback = gla.open_in_browser
          })
        end, 'Web Link', mode = 'v'
      },
    },


    t = {
      name = '+test',
      t = { ':UltestNearest<cr>', 'Test Nearest' },
      f = { ':Ultest<cr>', 'Test File' },
      d = { ':UltestDebugNearest<cr>', 'Debug Nearest Test' },
      o = { ':UltestOutput<cr>', 'Toggle Test Output' },
      x = { ':UltestSummary<cr>', 'Toggle Test Summary' },
      a = { ':TestSuite<cr>', 'Test Suite' },
      l = { ':TestLast<cr>', 'Rerun Last Test' },
      ['.'] = { ':TestVisit<cr>', 'Visit Test' },
    },

    x = {
      name = "+trouble",
      x = { "<cmd>LspTroubleToggle<cr>", "Toggle Trouble" },
      w = { "<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>", "Toggle Workspace Diagnostics" },
      d = { "<cmd>LspTroubleToggle lsp_document_diagnostics<cr>", "Toggle Document Diagnostics" },
      r = { "<cmd>LspTroubleToggle lsp_references<cr>", "Toggle References" },
      q = { "<cmd>LspTroubleToggle quickfix<cr>", "Toggle QuickFix" },
      l = { "<cmd>LspTroubleToggle loclist<cr>", "Toggle Location List" },
      t = { "<cmd>TodoTrouble<cr>", "Toggle TODOs" },
    },

    q = {
      name = '+quit',
      q = { '<cmd>:qa<cr>', 'Quit' },
      k = { '<cmd>:qa!<cr>', 'Quit without saving' },
      w = { '<cmd>:wa | qa!<cr>', 'Quit and save' },
    }
  },
})
