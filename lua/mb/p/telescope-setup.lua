local k = vim.keymap

k.nnoremap { '<leader>;', [[<cmd>Telescope find_files<cr>]] }
k.nnoremap { '<leader>f', [[<cmd>Telescope live_grep<cr>]] }
k.nnoremap { '<leader>h', [[<cmd>Telescope help_tags<cr>]] }
k.nnoremap { 'E', [[<cmd>Telescope buffers<cr>]]}
