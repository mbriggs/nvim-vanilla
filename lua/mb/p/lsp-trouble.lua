-- local k = vim.keymap
local wk = require('which-key')

wk.register({
  ["<leader>x"] = {
    name = "+trouble",
    x = { "<cmd>LspTroubleToggle<cr>", "Toggle Trouble" },
    w = { "<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>", "Toggle Workspace Diagnostics" },
    d = { "<cmd>LspTroubleToggle lsp_document_diagnostics<cr>", "Toggle Document Diagnostics" },
    r = { "<cmd>LspTroubleToggle lsp_references<cr>", "Toggle References" },
    q = { "<cmd>LspTroubleToggle quickfix<cr>", "Toggle QuickFix" },
    l = { "<cmd>LspTroubleToggle loclist<cr>", "Toggle Location List" },
    t = { "<cmd>TodoTrouble<cr>", "Toggle TODOs" },
  }
})


--[[ k.nnoremap{ '<leader>xx', '<cmd>LspTroubleToggle<cr>' }
k.nnoremap{ '<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>' }
k.nnoremap{ '<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagnostics<cr>' }
k.nnoremap{ '<leader>xq', '<cmd>LspTroubleToggle quickfix<cr>' }
k.nnoremap{ '<leader>xl', '<cmd>LspTroubleToggle loclist<cr>' }
k.nnoremap{ '<leader>xt', '<cmd>TodoTrouble<cr>' }
k.nnoremap{ 'gR', '<cmd>LspTroubleToggle lsp_references<cr>' } ]]
