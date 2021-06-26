local k = vim.keymap

function repeat_ft(reverse)
  local ls = require'lightspeed'
  ls.ft['instant-repeat?'] = true
  ls.ft:to(reverse, ls.ft['prev-t-like?'])
end

k.nnoremap { ';', function() repeat_ft(false) end, silent = true }
k.xnoremap { ';', function() repeat_ft(false) end, silent = true }
k.nnoremap { ',', function() repeat_ft(true) end, silent = true }
k.xnoremap { ',', function() repeat_ft(true) end, silent = true }
