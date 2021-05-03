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
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'sheerun/vim-polyglot'
  use 'haringsrob/nvim_context_vt'

  -- features
  use 'AndrewRadev/linediff.vim'
  use 'cohama/lexima.vim'
  use 'justinmk/vim-gtfo'
  use 'tyru/caw.vim'
  use 'dense-analysis/ale'
  use 'sbdchd/neoformat'
  use 'SirVer/ultisnips'
  use 'janko/vim-test'
  use 'kassio/neoterm'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'tjdevries/astronauta.nvim'
  use {'hrsh7th/nvim-compe', branch = 'master', config = function() require 'mb.plugins.compe' end}
  use {'kevinhwang91/nvim-bqf', config = function() require('bqf').setup({ auto_enable = true }) end}
  use {'glepnir/galaxyline.nvim', config = function() require 'mb.plugins.galaxyline' end}
  use {'kyazdani42/nvim-tree.lua', config = function() require 'mb.plugins.nvim-tree' end}

  -- git
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = function() require'mb.plugins.neogit' end}


  -- colors
  use 'morhetz/gruvbox'
  use 'joshdick/onedark.vim'
  use 'NovaDev94/lightline-onedark'
  use 'folke/tokyonight.nvim'

  -- vim
  use 'lambdalisue/suda.vim'
  use 'lambdalisue/reword.vim'
  use 'AndrewRadev/splitjoin.vim'
  use 'Olical/vim-enmasse'
  use 'kana/vim-niceblock'
  use 'machakann/vim-highlightedyank'
  use 'bkad/CamelCaseMotion'
  use 'ConradIrwin/vim-bracketed-paste'
  use 'alvan/vim-closetag'
  use 'Shougo/context_filetype.vim'
  use 'tpope/vim-abolish'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use {'junegunn/fzf', run = './install --all' }
  use {'junegunn/fzf.vim', config = function() require 'mb.plugins.fzf' end}

  -- text objects
  use 'kana/vim-textobj-user'
  use 'rhysd/vim-textobj-anyblock'
  use 'michaeljsmith/vim-indent-object'
  use 'wellle/targets.vim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'tjdevries/lsp_extensions.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
  use {'kabouzeid/nvim-lspinstall', config = function() require 'mb.plugins.lsp-install' end}
end)
