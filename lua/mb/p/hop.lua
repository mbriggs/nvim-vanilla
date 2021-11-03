local hop = require('hop')
local dir = require('hop.hint').HintDirection
local k = vim.keymap


hop.setup()

k.nnoremap{"s", function() hop.hint_char2({ direction = dir.AFTER_CURSOR }) end}
k.nnoremap{"S", function() hop.hint_char2({ direction = dir.BEFORE_CURSOR }) end}
k.nnoremap{"gs", function() hop.hint_char1({ direction = dir.AFTER_CURSOR }) end}
k.nnoremap{"gS", function() hop.hint_char1({ direction = dir.BEFORE_CURSOR }) end}
k.nnoremap{"gl", function() hop.hint_lines() end}

k.vnoremap{"s", function() hop.hint_char2({ direction = dir.AFTER_CURSOR }) end}
k.vnoremap{"S", function() hop.hint_char2({ direction = dir.BEFORE_CURSOR }) end}
k.vnoremap{"gs", function() hop.hint_char1({ direction = dir.AFTER_CURSOR }) end}
k.vnoremap{"gS", function() hop.hint_char1({ direction = dir.BEFORE_CURSOR }) end}
k.vnoremap{"gl", function() hop.hint_lines() end}
