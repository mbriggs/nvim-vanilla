local cmd = vim.cmd
local k = vim.keymap

k.nnoremap{ '<leader>tt', ':TestNearest<CR>' }
k.nnoremap{ '<leader>tf', ':TestFile<CR>' }
k.nnoremap{ '<leader>ta', ':TestSuite<CR>' }
k.nnoremap{ '<leader>tl', ':TestLast<CR>' }
k.nnoremap{ '<leader>t.', ':TestVisit<CR>' }

cmd([[let test#strategy = "tslime"]])
