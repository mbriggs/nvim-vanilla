local cmd = vim.cmd
local o = vim.o
local g = vim.g

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true
o.background = "dark"

-- o.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

cmd('colorscheme tokyonight')

