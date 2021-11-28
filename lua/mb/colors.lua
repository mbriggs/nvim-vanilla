local P = { installed = false }

function P.config()
  local cmd = vim.cmd
  local o = vim.o
  local g = vim.g

  cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

  o.termguicolors = true
  o.background = 'dark'

  require('onedark').setup()
end

function P.install(use)
  if P.installed then
    return
  end

  use { "navarasu/onedark.nvim", config = P.config }

  P.installed = true
end

return P
