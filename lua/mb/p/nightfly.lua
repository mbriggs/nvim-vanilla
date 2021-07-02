local cmd = vim.cmd
local o = vim.o
local g = vim.g

cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

o.termguicolors = true

g.nightflyCursorColor = 1
g.nightflyUnderlineMatchParen = 1
g.nightflyNormalFloat = 1

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single'
  }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
    border = 'single'
  }
)

cmd('colorscheme nightfly')

