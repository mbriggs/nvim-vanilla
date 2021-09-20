local cmd = vim.cmd
local o = vim.o
local g = vim.g


cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true

require('github-theme').setup({
  theme_style = 'dark',
  hide_inactive_statusline = true,
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  dark_sidebar = true,
})

