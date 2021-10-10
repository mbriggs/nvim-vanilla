local cmd = vim.cmd
local o = vim.o

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true
o.background = "dark"

local config = {
  darkSidebar = false,
}

require('onedark').setup(config)
_G.mb.colors = require('onedark.colors').setup(config)

vim.cmd [[
  " Enables cursor line position tracking:
  set cursorline
  " Removes he underline causes by enabling cursorline:
  highlight clear CursorLine
  " Sets the line numbering to red background:
  highlight CursorLineNR gui=bold
]]
