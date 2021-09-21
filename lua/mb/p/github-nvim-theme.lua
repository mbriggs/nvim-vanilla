local cmd = vim.cmd
local o = vim.o

vim.cmd[[augroup vimrc_colorscheme]]
  vim.cmd[[autocmd ColorScheme * lua mb.setup_github()]]
vim.cmd[[augroup END]]

function _G.mb.setup_github()
  local colors = require('github-theme.colors').setup()
  vim.cmd(string.format('hi StatusLine guibg=%s', colors.white))
end

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true

local theme = "light_default"
local bg = "light"

local pipe = io.popen("defaults read -g AppleInterfaceStyle")
local style = pipe:read()
pipe:close()

if style ~= nil then
  style = string.gsub(style, "%s+", "")
end

if style == "Dark" then
  bg = "dark"
  theme = "dimmed"
end

o.background = bg

require('github-theme').setup({
  theme_style = theme,
  function_style = 'italic',
  hide_inactive_statusline = true,
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  dark_sidebar = true,
})
