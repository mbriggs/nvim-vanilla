local spectre = require('spectre')
local k = vim.keymap

k.nnoremap{ "<leader>s", function() spectre.open() end }
k.vnoremap{ "<leader>s", function() spectre.open_visual() end }

