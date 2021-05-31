local cmd = vim.cmd
local g = vim.g
local k = vim.keymap

g.ultest_use_pty = true

k.nnoremap{ '<leader>tt', ':UltestNearest<CR>' }
k.nnoremap{ '<leader>tf', ':Ultest<CR>' }
k.nnoremap{ '<leader>td', ':UltestDebugNearest<CR>' }
k.nnoremap{ '<leader>to', ':UltestOutput<CR>' }
k.nnoremap{ '<leader>tx', ':UltestSummary<CR>' }
k.nnoremap{ '<leader>ta', ':TestSuite<CR>' }
k.nnoremap{ '<leader>tl', ':TestLast<CR>' }
k.nnoremap{ '<leader>t.', ':TestVisit<CR>' }

