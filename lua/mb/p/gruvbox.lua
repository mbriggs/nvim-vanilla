local cmd = vim.cmd
local o = vim.o
local g = vim.g

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true
o.background = "dark"

g.gruvbox_material_background = 'hard'
g.gruvbox_material_enable_italic = 1
g.gruvbox_material_enable_bold = 1
g.gruvbox_material_cursor = 'red'
g.gruvbox_material_palette = 'original'
g.gruvbox_material_sign_column_background = 'none'

cmd('colorscheme gruvbox-material')

