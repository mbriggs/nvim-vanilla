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
  ---- bootstrap
  use {'wbthomason/packer.nvim', opt = true}

  --- polyfills
  use { 'tjdevries/astronauta.nvim' }

  --- features
  require('mb.which-key').install(use)
  require('mb.snippets').install(use)
  require('mb.completion').install(use)
  require('mb.syntax').install(use)
  require('mb.motion').install(use)
  require('mb.syntax').install(use)
  require('mb.core').install(use)
  require('mb.debugging').install(use)
  require('mb.telescope').install(use)
  require('mb.explorer').install(use)
  require('mb.git').install(use)
  require('mb.tmux').install(use)
  require('mb.lsp').install(use)
  require('mb.colors').install(use)

end, config = {
  profile = {
    enable = true,
    threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
  }
}})

