vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.cmd('colorscheme tokyonight')
