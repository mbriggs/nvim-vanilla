local neogit = require('neogit')

neogit.setup {}

nnoremap('<leader>gg', "<esc>:Neogit<cr>")
nnoremap('<leader>gc', "<esc>:Neogit commit<cr>")
