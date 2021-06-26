local k = vim.keymap

k.nnoremap { '<leader>;', [[<cmd>Telescope find_files<cr>]] }
k.nnoremap { '<leader>f', [[<cmd>Telescope live_grep<cr>]] }
k.nnoremap { '<leader>h', [[<cmd>Telescope help_tags<cr>]] }
k.nnoremap { 'E', [[<cmd>Telescope oldfiles<cr>]]}
k.nnoremap { '<leader>e', [[<cmd>Telescope file_browser<cr>]]}
k.nnoremap { '<leader>:', [[<cmd>Telescope commands<cr>]]}
k.nnoremap { '<leader>\'', [[<cmd>Telescope keymaps<cr>]]}
k.nnoremap { '<leader>"', [[<cmd>Telescope filetypes<cr>]]}

-- lsp
k.nnoremap{ '<leader>.', [[<cmd>Telescope lsp_definitions]] }
k.nnoremap{ '<leader>/', [[<cmd>Telescope lsp_references]] }
k.nnoremap{ 'ga', [[<cmd>Telescope lsp_code_actions]] }
k.nnoremap{ '<leader>xf', [[<cmd>Telescope lsp_workspace_diagnostics]] }
k.nnoremap{ '<leader>m', [[<cmd>Telescope lsp_document_symbols]] }

-- git
k.nnoremap{ '<leader>gc', [[<cmd>Telescope git_bcommits]] }
k.nnoremap{ '<leader>gg', [[<cmd>Telescope git_branches]] }
k.nnoremap{ '<leader>gs', [[<cmd>Telescope git_status]] }

