vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- vim.api.nvim_command('highlight LightBulbFloatWin ctermfg= ctermbg= guifg= guibg=')
-- vim.api.nvim_command('highlight LightBulbVirtualText ctermfg= ctermbg= guifg= guibg=')

