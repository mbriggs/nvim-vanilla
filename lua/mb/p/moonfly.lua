local cmd = vim.cmd
local o = vim.o
local g = vim.g

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')


o.termguicolors = true
g.moonflyCursorColor = 1
g.moonflyNormalFloat = 1
g.moonflyUnderlineMatchParen = 1

vim.cmd [[colorscheme moonfly]]
