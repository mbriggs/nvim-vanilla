local k = vim.keymap



k.nnoremap{ '<leader>xx', '<cmd>LspTroubleToggle<cr>' }
k.nnoremap{ '<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>' }
k.nnoremap{ '<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagnostics<cr>' }
k.nnoremap{ '<leader>xq', '<cmd>LspTroubleToggle quickfix<cr>' }
k.nnoremap{ '<leader>xl', '<cmd>LspTroubleToggle loclist<cr>' }
k.nnoremap{ '<leader>xt', '<cmd>TodoTrouble<cr>' }
k.nnoremap{ 'gR', '<cmd>LspTroubleToggle lsp_references<cr>' }
