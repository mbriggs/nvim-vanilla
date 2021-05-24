nnoremap('<leader>tt', ':TestNearest<CR>')
nnoremap('<leader>tf', ':TestFile<CR>')
nnoremap('<leader>ta', ':TestSuite<CR>')
nnoremap('<leader>tl', ':TestLast<CR>')
nnoremap('<leader>t.', ':TestVisit<CR>')

vim.api.nvim_command([[let test#strategy = "tslime"]])
