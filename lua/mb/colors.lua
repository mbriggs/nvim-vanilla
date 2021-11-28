local P = { installed = false }

function P.config()
  local cmd = vim.cmd
  local o = vim.o
  local g = vim.g

  cmd([[
" nvim-cmp visual studio code dark+ colors 

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  ]])

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
