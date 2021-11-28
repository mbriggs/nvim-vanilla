local P = { installed = false }

local function gs_config()
  require'gitsigns'.setup()
end

local function gl_config()
  require'gitlinker'.setup()
end

local function octo_config()
  require'octo'.setup()
end

function P.install(use)
  if P.installed then
    return
  end

  use {
    { 'ruifm/gitlinker.nvim', config = gl_config },
    { 'rhysd/git-messenger.vim', cmd = [[GitMessenger]] },
    { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim', config = gs_config },
    { 'kdheepak/lazygit.nvim', cmd = 'LazyGit' },
    { 'pwntester/octo.nvim', config = octo_config },
  }

  P.installed = true
end

return P
