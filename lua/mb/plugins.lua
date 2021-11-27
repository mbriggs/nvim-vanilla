local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd
local g = vim.g

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
  }

  use {'folke/which-key.nvim',
    config = [[require'mb.p.which-key']]
  }

  -- completion
  use {'hrsh7th/vim-vsnip',
    config = [[require'mb.p.vsnip']]
  }

  use {'onsails/lspkind-nvim',
    config = [[require('lspkind').init({})]]
  }

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

  ---- vim features
  -- Things that transparently add or augment features in neovim
  use {
    {'nvim-treesitter/nvim-treesitter',
      requires = [[windwp/nvim-ts-autotag]],
      run = ':TSUpdate',
      config = [[require'mb.p.treesitter']]
    },
    {'rhysd/vim-textobj-anyblock',
      requires = 'kana/vim-textobj-user'
    },
    {"windwp/nvim-autopairs",
      config = [[require'mb.p.autopairs']]
    },
    {'phaazon/hop.nvim',
      config = [[require'mb.p.hop']]
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
    -- {'b3nj5m1n/kommentary',
    --   config = [[require'mb.p.kommentary']]
    -- },
    {'numToStr/Comment.nvim',
      config = [[require'mb.p.comment']]
    },
    'lambdalisue/vim-protocol',
    'justinmk/vim-gtfo',
    'antoinemadec/FixCursorHold.nvim',
    'kana/vim-niceblock',
    {'ojroques/nvim-bufdel',
      config = [[require'mb.p.bufdel']]
    },
    {'lambdalisue/suda.vim',
      config = [[require'mb.p.suda']]
    },
    'machakann/vim-highlightedyank',
    'ConradIrwin/vim-bracketed-paste',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tpope/vim-apathy',
    'tpope/vim-eunuch',
    'tpope/vim-jdaddy',
    'tpope/vim-afterimage',
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
    {'ldelossa/calltree.nvim',
      config = [[require'mb.p.calltree']],
    },
    {'janko/vim-test',
      requires = 'preservim/vimux',
      config = [[require'mb.p.vim-test']]
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
    {'nvim-neorg/neorg',
      requires = "nvim-lua/plenary.nvim",
      config = [[require'mb.p.neorg']]
    },
    {'mcchrish/nnn.vim',
      config = [[require'mb.p.nnn']],
    },
    'lambdalisue/reword.vim',
    'alvan/vim-closetag'
  }

  -- git
  use {
    {'ruifm/gitlinker.nvim',
      config = [[require'gitlinker'.setup()]]
    },
    {'rhysd/git-messenger.vim',
      cmd = [[GitMessenger]]
    },
    {'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = [[require'gitsigns'.setup()]]
    },
    {'pwntester/octo.nvim',
      config = [[require"octo".setup()]],
    }
  }

  -- tmux
  use {
    {'christoomey/vim-tmux-navigator',
      config = [[require'mb.p.tmux-navigator']]
    },
    'jgdavey/tslime.vim'
  }

  -- use {'hoob3rt/lualine.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = [[require'mb.p.lualine']]
  -- }

  -- colors
  -- use {"catppuccin/nvim",
  --   config = [[require'mb.p.catppucin']],
  --   branch = "main"
  -- }
  use {"rose-pine/neovim",
    as = 'rose-pine',
    config = [[require'mb.p.rose-pine']],
  }

  -- use {"bluz71/vim-moonfly-colors",
  --   config = [[require'mb.p.moonfly']]
  -- }
  -- use {'projekt0n/github-nvim-theme',
  --     config = [[require'mb.p.github-nvim-theme']]
  -- }

  -- use {'olimorris/onedarkpro.nvim',
  --   config = [[require'mb.p.onedarkpro']]
  -- }

  -- LSP
  use {
    {'neovim/nvim-lspconfig',
      config = [[require'mb.p.lspconfig']]
    },
    {'williamboman/nvim-lsp-installer',
      config = [[require'mb.p.lspinstaller']]
    },
    {'weilbith/nvim-code-action-menu',
      setup = [[require'mb.p.code-action-menu']],
      cmd = 'CodeActionMenu'
    },
    'nvim-lua/lsp-status.nvim',
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

