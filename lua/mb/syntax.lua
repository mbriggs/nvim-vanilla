local P = { installed = false }

local function ts_config()
  local ts_configs = require('nvim-treesitter.configs')

  ts_configs.setup {
    ensure_installed = 'maintained',
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = {enable = true},
    incremental_selection = {
      keymaps = {
        init_selection = '<C-D>',
        scope_incremental = '<C-S-D>',
        node_incremental = '<C-D>',
        node_decremental = '<S-D>'
      },
      enable = true
    },
    refactor = {
      highlight_definitions = {enable = true}
    },
    autotag = {
      enable = true,
    }
  }
end

function P.install(use)
  if P.installed then
    return
  end

  -- git commits
  use 'rhysd/committia.vim'

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = [[windwp/nvim-ts-autotag]],
    run = ':TSUpdate',
    config = ts_config,
  }

  P.installed = true
end

return P
