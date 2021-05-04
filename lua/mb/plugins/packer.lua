local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require'mb.plugins.treesitter' end}
  use 'sheerun/vim-polyglot'
  use 'haringsrob/nvim_context_vt'

  -- features
  use 'AndrewRadev/linediff.vim'
  use 'justinmk/vim-gtfo'
  use 'janko/vim-test'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'tjdevries/astronauta.nvim'
  use 'b3nj5m1n/kommentary'
  use {'hrsh7th/nvim-compe', branch = 'master', config = function() require 'mb.plugins.compe' end}
  use {'glepnir/galaxyline.nvim', config = function() require 'mb.plugins.galaxyline' end}
  use {'kyazdani42/nvim-tree.lua', config = function() require 'mb.plugins.nvim-tree' end}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}, config = function() require'mb.plugins.telescope' end}
  use {'tamago324/lir.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require'mb.plugins.lir' end}

  -- git
  use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require'gitsigns'.setup() end}
  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = function() require'mb.plugins.neogit' end}

  -- go
  use {'sebdah/vim-delve', config = function() require'mb.plugins.delve' end}

  -- colors
  use 'morhetz/gruvbox'
  use 'joshdick/onedark.vim'
  use 'folke/tokyonight.nvim'

  -- vim
  use 'lambdalisue/suda.vim'
  use 'lambdalisue/reword.vim'
  use 'Olical/vim-enmasse'
  use 'kana/vim-niceblock'
  use 'machakann/vim-highlightedyank'
  use 'bkad/CamelCaseMotion'
  use 'ConradIrwin/vim-bracketed-paste'
  use 'alvan/vim-closetag'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use {'mhartington/formatter.nvim', config = function() require'mb.plugins.formatter' end}

  -- text objects
  use 'kana/vim-textobj-user'
  use 'rhysd/vim-textobj-anyblock'
  use 'wellle/targets.vim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use {'glepnir/lspsaga.nvim', config = function() require'mb.plugins.lspsaga' end}
  use {'folke/lsp-trouble.nvim', requires = "kyazdani42/nvim-web-devicons", config = function() require'mb.plugins.lsp-trouble' end}
  use {'kabouzeid/nvim-lspinstall', config = function() require 'mb.plugins.lsp-install' end}
end)
