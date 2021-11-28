 --- __  __      _   _     ___     _
 ---|  \/  |__ _| |_| |_  | _ )_ _(_)__ _ __ _ ___
 ---| |\/| / _` |  _|  _| | _ \ '_| / _` / _` (_-<
 ---|_|  |_\__,_|\__|\__| |___/_| |_\__, \__, /__/
 ---                                |___/|___/


local cmd = vim.cmd
local g = vim.g

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip', 'man', 'matchit', 'matchparen', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip',
  'netrwPlugin'
}
for i = 1, 10 do g['loaded_' .. disabled_built_ins[i]] = 1 end

-- some ft mappings
cmd([[
  au BufRead,BufNewFile *.gohtml set ft=html
  au BufRead,BufNewFile .envrc* set ft=bash
  au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
]])

require'mb.options'
require'mb.plugins'
require'mb.bindings'

-- cmd([[
-- " Background colors for active vs inactive windows
-- hi ActiveWindow guibg=#17252c
-- hi InactiveWindow guibg=#0D1B22
-- hi ActiveTerminal guibg=#333333
--
-- " Call method on window enter
-- augroup WindowManagement
--   autocmd!
--   autocmd WinEnter * call Handle_Win_Enter()
-- augroup END
--
-- " Change highlight group of preview window when open
-- function! Handle_Win_Enter()
--   if &previewwindow
--     setlocal winhighlight=Normal:MarkdownError
--   elseif &buftype ==# 'terminal'
--     setlocal winhighlight=Normal:ActiveTerminal
--   else
--     setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
--   endif
-- endfunction
-- ]])
