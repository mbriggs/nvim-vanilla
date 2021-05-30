local t = require('telescope')
local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local k = vim.keymap

t.setup{
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

t.load_extension('fzf')
-- t.load_extension('frecency')

k.nnoremap { '<leader>;', function() require'telescope.builtin'.find_files() end }
k.nnoremap { '<leader>f', function() require'telescope.builtin'.live_grep() end }
k.nnoremap { 'E', function() require'telescope.builtin'.buffers() end }
