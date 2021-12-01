local P = { installed = false }


function P.ap_config()
  local ap = require('nvim-autopairs')

  ap.setup{}
  ap.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
  ap.add_rules(require('nvim-autopairs.rules.endwise-lua'))
  ap.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

  require("nvim-autopairs").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = true, -- automatically select the first item
    insert = false, -- use insert confirm behavior instead of replace
    map_char = { -- modifies the function or method delimiter by filetypes
      all = '(',
      tex = '{'
    }
  })
end

function P.mu_config()
  require'nvim-treesitter.configs'.setup {
    matchup = { enable = true }
  }

end

function P.sl_config()
  local k = vim.keymap
  local starlite = require("starlite")

  k.nnoremap{ '*', function() starlite.star() end, silent = true}
  k.nnoremap{ 'g*', function() starlite.g_star() end, silent = true}
  k.nnoremap{ '#', function() starlite.hash() end, silent = true}
  k.nnoremap{ 'g#', function() starlite.g_hash() end, silent = true}
end


function P.clr_config()
  require 'colorizer'.setup {
    '*'; -- Highlight all files, but customize some others.
    css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
    html = { names = false; } -- Disable parsing "names" like Blue or Gray
  }
end

function P.cmnt_config()
  require('Comment').setup({
    padding = true
  })
end

function P.numb_config()
  require('numb').setup()
end

function P.hop_config()
  local hop = require('hop')
  local dir = require('hop.hint').HintDirection
  local k = vim.keymap

  hop.setup()

  k.nnoremap{"s", function() hop.hint_char2({ direction = dir.AFTER_CURSOR }) end}
  k.nnoremap{"S", function() hop.hint_char2({ direction = dir.BEFORE_CURSOR }) end}
  k.nnoremap{"gs", function() hop.hint_char1({ direction = dir.AFTER_CURSOR }) end}
  k.nnoremap{"gS", function() hop.hint_char1({ direction = dir.BEFORE_CURSOR }) end}
  k.nnoremap{"gl", function() hop.hint_lines() end}

  k.vnoremap{"s", function() hop.hint_char2({ direction = dir.AFTER_CURSOR }) end}
  k.vnoremap{"S", function() hop.hint_char2({ direction = dir.BEFORE_CURSOR }) end}
  k.vnoremap{"gs", function() hop.hint_char1({ direction = dir.AFTER_CURSOR }) end}
  k.vnoremap{"gS", function() hop.hint_char1({ direction = dir.BEFORE_CURSOR }) end}
  k.vnoremap{"gl", function() hop.hint_lines() end}
end

function P.bd_config()
  require('bufdel').setup {
    next = 'alternate',
    quit = false,
  }
end

function P.bqf_config()
  require('bqf').setup({
      auto_enable = true
  })
end

function P.install(use)
  if P.installed then
    return
  end

  -- required for matchup
  require("mb.syntax").install(use)

  vim.g.matchup_matchparen_offscreen = { method = "popup" }

  use {
    { "windwp/nvim-autopairs", config = P.ap_config },
    { 'ironhouzi/starlite-nvim', config = P.sl_config },
    { 'nacro90/numb.nvim', config = P.numb_config },
    { "norcalli/nvim-colorizer.lua", config = P.clr_config },
    { 'numToStr/Comment.nvim', config = P.cmnt_config },
    { 'phaazon/hop.nvim', config = P.hop_config },
    { 'ojroques/nvim-bufdel', config = P.bd_config },
    { 'janko/vim-test',
      requires = 'preservim/vimux',
      config = [[vim.g['test#strategy'] = 'vimux']],
    },
    { 'folke/todo-comments.nvim',
      requires = "nvim-lua/plenary.nvim",
      config = [[require'todo-comments'.setup{}]]
    },
    { 'kevinhwang91/nvim-bqf',
      requires = {
        {'junegunn/fzf',
          dir = '~/.fzf',
          run = './install --all'
        },
        'junegunn/fzf.vim'
      },
      config = P.bqf_config
    },
    { 'andymass/vim-matchup', config = P.mu_config },
    'lambdalisue/suda.vim',
    'machakann/vim-highlightedyank',
    'ConradIrwin/vim-bracketed-paste',
    'tpope/vim-repeat',
    'lambdalisue/vim-protocol',
    'justinmk/vim-gtfo',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tpope/vim-apathy',
    'tpope/vim-eunuch',
    'tpope/vim-jdaddy',
    'tpope/vim-afterimage',
    'google/vim-searchindex',
    'lambdalisue/reword.vim',
    'alvan/vim-closetag',
  }

  P.installed = true
end

return P
