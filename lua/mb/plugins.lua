local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

cmd [[packadd packer.nvim]]


return require('packer').startup({function(use)
  -- packer
  use {'wbthomason/packer.nvim',
    opt = true
  }

  -- syntax
  use {
    {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require'mb.p.treesitter']]
    },
    'sheerun/vim-polyglot'
  }

  -- vim features
  use {
    {"steelsojka/pears.nvim",
      config = [[require'pears'.setup()]]
    },
    'chaoren/vim-wordmotion',
    'dstein64/vim-startuptime',
    'lambdalisue/vim-protocol',
    'tjdevries/astronauta.nvim',
    'justinmk/vim-gtfo',
    'antoinemadec/FixCursorHold.nvim',
    'b3nj5m1n/kommentary',
    'kana/vim-niceblock',
    'lambdalisue/suda.vim',
    'machakann/vim-highlightedyank',
    'ConradIrwin/vim-bracketed-paste',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'andymass/vim-matchup',
    'rhysd/committia.vim',
    'google/vim-searchindex'
  }


  -- debugging
  use {
    'theHamsta/nvim-dap-virtual-text',
    {'mfussenegger/nvim-dap',
      config = [[require'dap']]
    },
    {'rcarriga/nvim-dap-ui',
      requires = {"mfussenegger/nvim-dap"}
    }
  }

  -- completion
  use {
    'hrsh7th/nvim-compe',
    branch = 'master',
    config = [[require'mb.p.compe']]
  }

  -- modeline
  use {'glepnir/galaxyline.nvim',
    config = [[require'mb.p.galaxyline']]
  }


  -- telescope
  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim',
        run = [[make]]
      },
    },
    setup = [[require'mb.p.telescope-setup']],
    config = [[require'mb.p.telescope']],
    cmd = [[Telescope]]
  }


  -- toolbox
  use {
    {'rcarriga/vim-ultest',
      requires = {'janko/vim-test'},
      run = ':UpdateRemotePlugins',
      config = [[require'mb.p.vim-ultest']]
    },
    {'kyazdani42/nvim-tree.lua',
      config = [[require'mb.p.nvim-tree']]
    },
    {'tamago324/lir.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = [[require'mb.p.lir']]
    },
    {'folke/todo-comments.nvim',
      requires = "nvim-lua/plenary.nvim",
      config = [[require'todo-comments'.setup{}]]
    },
    {'mhartington/formatter.nvim',
      config = [[require'mb.p.formatter']]
    },
    'lambdalisue/reword.vim',
    {'Olical/vim-enmasse',
      cmd = "EnMasse"
    },
    -- 'kevinhwang91/nvim-bqf',
    'alvan/vim-closetag'
  }

  -- git
  use {
    {'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = [[require'gitsigns'.setup()]]
    },
    {'pwntester/octo.nvim',
      config = [[require"octo".setup()]],
      cmd = [[Octo]]
    }
  }

  -- tmux
  use {
    {'christoomey/vim-tmux-navigator',
      config = [[require'mb.p.tmux-navigator']]
    },
    'jgdavey/tslime.vim'
  }

  -- colors
  use {
    'rafamadriz/neon',
    config = [[require'mb.p.neon']]
  }

  -- text objects
  use {
    'kana/vim-textobj-user',
    'rhysd/vim-textobj-anyblock',
    'wellle/targets.vim',
  }

  -- LSP
  use {
    {'neovim/nvim-lspconfig',
      config = [[require'mb.p.lspconfig']]
    },
    'nvim-lua/lsp-status.nvim',
    {'glepnir/lspsaga.nvim',
      config = [[require'mb.p.lspsaga']]
    },
    {'folke/lsp-trouble.nvim',
      requires = "kyazdani42/nvim-web-devicons",
      setup = [[require'mb.p.lsp-trouble']],
      config = [[require"trouble".setup {}]]
    }
  }
end, config = {
  profile = {
    enable = true,
    threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
  }
}})
