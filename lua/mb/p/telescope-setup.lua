local k = vim.keymap

k.nnoremap { '<leader>;', [[<cmd>Telescope find_files<cr>]] }
k.nnoremap { '<leader>f', [[<cmd>Telescope live_grep<cr>]] }
k.nnoremap { '<leader>h', [[<cmd>Telescope help_tags<cr>]] }
k.nnoremap { 'E', [[<cmd>Telescope oldfiles<cr>]]}
-- k.nnoremap { '<leader>e', [[<cmd>Telescope file_browser<cr>]]}
k.nnoremap { '<leader>:', [[<cmd>Telescope commands<cr>]]}
k.nnoremap { '<leader>\'', [[<cmd>Telescope keymaps<cr>]]}
k.nnoremap { '<leader>"', [[<cmd>Telescope filetypes<cr>]]}

-- lsp
-- k.nnoremap{ '<leader>.', [[<cmd>Telescope lsp_definitions<cr>]] }
-- k.nnoremap{ '<leader>/', [[<cmd>Telescope lsp_references<cr>]] }
-- k.nnoremap{ 'ga', [[<cmd>Telescope lsp_code_actions<cr>]] }
k.nnoremap{ '<leader>xf', [[<cmd>Telescope lsp_workspace_diagnostics<cr>]] }
k.nnoremap{ '<leader>m', [[<cmd>Telescope lsp_document_symbols<cr>]] }
k.nnoremap{ '<leader>M', [[<cmd>Telescope lsp_dynamic_workspace_symbols<cr>]] }

-- git
k.nnoremap{ '<leader>gc', [[<cmd>Telescope git_bcommits<cr>]] }
k.nnoremap{ '<leader>gg', [[<cmd>Telescope git_branches<cr>]] }
k.nnoremap{ '<leader>gs', [[<cmd>Telescope git_status<cr>]] }

