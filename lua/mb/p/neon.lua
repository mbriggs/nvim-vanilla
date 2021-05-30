local cmd = vim.cmd
local o = vim.o
local g = vim.g

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true

g.neon_style = "default"
g.neon_italic_keyword = true
g.neon_italic_function = true

cmd('colorscheme neon')

