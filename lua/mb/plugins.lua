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
  ---- packer
  use {'wbthomason/packer.nvim',
    opt = true
  }

  ---- vim features
  -- Things that transparently add or augment features in neovim
  use {
    {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require'mb.p.treesitter']]
    },
    {"steelsojka/pears.nvim",
      config = [[require'pears'.setup()]]
    },
    {"yuttie/comfortable-motion.vim",
      config = [[require'mb.p.comfortable-motion']]
    },
    {"norcalli/nvim-colorizer.lua",
      config = [[require'mb.p.colorizer']]
    },
    {'chaoren/vim-wordmotion',
      setup = [[vim.g.wordmotion_prefix = '<space>']]
    },
    {'kevinhwang91/nvim-bqf',
      requires = {
        {'junegunn/fzf',
          dir = '~/.fzf',
          run = './install --all'
        },
        'junegunn/fzf.vim'
      },
      config = [[require'mb.p.nvim-bqf']]
    },
    {'Pocco81/AutoSave.nvim',
      config = [[require'autosave'.setup()]]
    },
    {'glepnir/galaxyline.nvim',
      config = [[require'mb.p.galaxyline']]
    },
    {'hrsh7th/nvim-compe',
      branch = 'master',
      config = [[require'mb.p.compe']]
    },
    'dhruvasagar/vim-zoom',
    'dstein64/vim-startuptime',
    'famiu/nvim-reload',
    'famiu/bufdelete.nvim',
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


  ---- debugging
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      {'theHamsta/nvim-dap-virtual-text',
        requires = {'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter'}
      }
    },
    config = [[require'mb.p.dap']]
  }

  ---- telescope
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


  ---- toolbox
  -- adds tools to neovim
  use {
    {'tamago324/lir.nvim',
      config = [[require'mb.p.lir']]
    },
    {'rcarriga/vim-ultest',
      requires = {'janko/vim-test'},
      run = ':UpdateRemotePlugins',
      config = [[require'mb.p.vim-ultest']]
    },
    {'kyazdani42/nvim-tree.lua',
      config = [[require'mb.p.nvim-tree']]
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
    'ruifm/gitlinker.nvim',
    'rhysd/git-messenger.vim',
    {'TimUntersberger/neogit'},
    'tveskag/nvim-blame-line',
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
    {'rafamadriz/neon',
      -- config = [[require'mb.p.neon']]
    },
    {'bluz71/vim-nightfly-guicolors',
      -- config = [[require'mb.p.nightfly']]
    },
    {'sainnhe/gruvbox-material',
      -- config = [[require'mb.p.gruvbox']]
    },
    {'folke/tokyonight.nvim',
      config = [[require'mb.p.tokyonight']]
    }
  }

  -- text objects
  use {
    'kana/vim-textobj-user',
    'rhysd/vim-textobj-anyblock',
    'wellle/targets.vim',
    {'nvim-treesitter/nvim-treesitter-textobjects',
      config = [[require'mb.p.treesitter-textobjects']]
    }
  }

  -- LSP
  use {
    {'neovim/nvim-lspconfig',
      config = [[require'mb.p.lspconfig']]
    },
    {'glepnir/lspsaga.nvim',
      config = [[require'mb.p.lspsaga']]
    },
    'nvim-lua/lsp-status.nvim',
    {'ray-x/lsp_signature.nvim',
      setup = [[require'mb.p.lsp_signature']]
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
