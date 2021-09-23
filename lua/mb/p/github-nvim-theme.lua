local cmd = vim.cmd
local o = vim.o

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true

function _G.mb.colors()
  local theme = "light_default"
  local bg = "light"

  if mb.dark then
    bg = "dark"
    theme = "dimmed"
  end

  o.background = bg

  require('github-theme').setup({
    theme_style = theme,
    hide_inactive_statusline = true,
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    dark_sidebar = true,
  })
end


mb.colors()
