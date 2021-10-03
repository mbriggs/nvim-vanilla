local k = vim.keymap
local starlite = require("starlite")

k.nnoremap{ '*', function() starlite.star() end, silent = true}
k.nnoremap{ 'g*', function() starlite.g_star() end, silent = true}
k.nnoremap{ '#', function() starlite.hash() end, silent = true}
k.nnoremap{ 'g#', function() starlite.g_hash() end, silent = true}
