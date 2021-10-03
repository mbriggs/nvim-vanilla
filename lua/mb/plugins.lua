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
  use {'wbthomason/packer.nvim', opt = true}


  --- load super early
  use {
    'tjdevries/astronauta.nvim',
    {'folke/which-key.nvim',
      config = [[require'mb.p.which-key']]
    },
  }

  --- tree
  use {
    {"kyazdani42/nvim-web-devicons"},
    {'kyazdani42/nvim-tree.lua',
      config = [[require'mb.p.nvim-tree']]
    },
    {"projekt0n/circles.nvim",
      config = [[require'mb.p.circles']]
    }
  }

  ---- vim features
  -- Things that transparently add or augment features in neovim
  use {
    {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require'mb.p.treesitter']]
    },
    {'rhysd/vim-textobj-anyblock',
      requires = 'kana/vim-textobj-user'
    },
    {"steelsojka/pears.nvim",
      config = [[require'pears'.setup()]]
    },
    {'ironhouzi/starlite-nvim',
      config = [[require'mb.p.starlite']]
    },
    {'nacro90/numb.nvim',
      config = function()
        require('numb').setup()
      end
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
    {'b3nj5m1n/kommentary',
      config = [[require'mb.p.kommentary']]
    },
    'dhruvasagar/vim-zoom',
    'dstein64/vim-startuptime',
    'famiu/nvim-reload',
    'famiu/bufdelete.nvim',
    'lambdalisue/vim-protocol',
    'justinmk/vim-gtfo',
    'antoinemadec/FixCursorHold.nvim',
    'kana/vim-niceblock',
    {'lambdalisue/suda.vim',
      config = [[require'mb.p.suda']]
    },
    'machakann/vim-highlightedyank',
    'ConradIrwin/vim-bracketed-paste',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'andymass/vim-matchup',
    'rhysd/committia.vim',
    'google/vim-searchindex'
  }

  -- completion
  use {'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'ray-x/cmp-treesitter',
    },
    config = [[require'mb.p.cmp']]
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
    {'rcarriga/vim-ultest',
      requires = {'janko/vim-test'},
      run = ':UpdateRemotePlugins',
      config = [[require'mb.p.vim-ultest']]
    },
    {'luissimas/eval.nvim',
      config = [[require'mb.p.eval']]
    },
    {'kdheepak/lazygit.nvim',
      setup = [[require'mb.p.lazygit']],
      cmd = 'LazyGit'
    },
    {'folke/todo-comments.nvim',
      requires = "nvim-lua/plenary.nvim",
      config = [[require'todo-comments'.setup{}]]
    },
    {'mhartington/formatter.nvim',
      config = [[require'mb.p.formatter']]
    },
    'lambdalisue/reword.vim',
    'alvan/vim-closetag'
  }

  -- git
  use {
    'ruifm/gitlinker.nvim',
    'rhysd/git-messenger.vim',
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

  use {'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = [[require'mb.p.lualine']]
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
      -- config = [[require'mb.p.tokyonight']]
    },
    {'projekt0n/github-nvim-theme',
      config = [[require'mb.p.github-nvim-theme']]
    },
  }

  -- LSP
  use {
    {'neovim/nvim-lspconfig',
      config = [[require'mb.p.lspconfig']]
    },
    {'onsails/lspkind-nvim',
      config = [[require'mb.p.lspkind']]
    },
    {'williamboman/nvim-lsp-installer',
      config = [[require'mb.p.lspinstaller']]
    },
    {'weilbith/nvim-code-action-menu',
      setup = [[require'mb.p.code-action-menu']],
      cmd = 'CodeActionMenu'
    },
    'nvim-lua/lsp-status.nvim',
    {'ray-x/lsp_signature.nvim',
      setup = [[require'mb.p.lsp_signature']]
    },
    {'folke/lsp-trouble.nvim',
      requires = "kyazdani42/nvim-web-devicons",
      setup = [[require'mb.p.lsp-trouble']],
      config = [[require"trouble".setup {}]]
    },
    {'kosayoda/nvim-lightbulb',
      config = [[require"mb.p.lightbulb"]]
    }
  }
end, config = {
  profile = {
    enable = true,
    threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
  }
}})

