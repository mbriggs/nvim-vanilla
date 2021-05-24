local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")

require'telescope'.setup{
  defaults = {
    file_ignore_patterns = {"node_modules/*"},
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-t>"] = trouble.open_with_trouble,
      },
    }
  },
  extensions = {
    fzf = {
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

require('telescope').load_extension('fzf')

nnoremap('<leader>;', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
nnoremap('<leader>f', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
nnoremap('E', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
