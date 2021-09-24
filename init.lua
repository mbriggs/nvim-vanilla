 --- __  __      _   _     ___     _
 ---|  \/  |__ _| |_| |_  | _ )_ _(_)__ _ __ _ ___
 ---| |\/| / _` |  _|  _| | _ \ '_| / _` / _` (_-<
 ---|_|  |_\__,_|\__|\__| |___/_| |_\__, \__, /__/
 ---                                |___/|___/


local cmd = vim.cmd
local g = vim.g

_G.mb = {}

-- figure out if we are in dark mode
local pipe = io.popen("defaults read -g AppleInterfaceStyle")
local style = pipe:read()
pipe:close()

if style ~= nil then
  style = string.gsub(style, "%s+", "")
end

mb.dark = style == "Dark"


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

local wk = require('which-key')
wk.register({
  ['<leader>es'] = { '<cmd>PackerSync<cr>', 'Sync Plugins' }
})
