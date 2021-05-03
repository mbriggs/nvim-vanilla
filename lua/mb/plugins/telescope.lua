require'telescope'.setup{}

nnoremap('<leader>;', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
nnoremap('<leader>f', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
nnoremap('E', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
