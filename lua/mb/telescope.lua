local P = { installed = false }

local function ts_config()
  local t = require('telescope')
  local actions = require('telescope.actions')
  local trouble = require("trouble.providers.telescope")

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
  -- t.load_extension('dap')
end

function P.install(use)
  if P.installed then
    return
  end

  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim',
        run = [[make]]
      },
    },
    config = ts_config,
    cmd = [[Telescope]]
  }

  P.installed = true
end

return P
