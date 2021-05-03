local actions = require('telescope.actions')

require'telescope'.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
      n = {}
    }
  }
}

nnoremap('<leader>;', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
nnoremap('<leader>f', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
nnoremap('E', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
