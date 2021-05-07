vim.api.nvim_command([[
  au BufRead,BufNewFile *.gohtml set ft=html
  au BufRead,BufNewFile .envrc* set ft=bash
]])
