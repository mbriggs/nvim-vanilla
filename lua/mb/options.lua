local o = vim.o
local g = vim.g
local opt = vim.opt

local os = require'os'

local home = os.getenv('HOME')
local term = os.getenv('TERM')

o.inccommand = 'nosplit'
o.secure = true
o.splitright = true
o.showcmd = true
o.backupdir = home .. '/.config/nvim/backup'
o.directory = home .. '/.config/nvim/backup'
o.undodir = home .. '/.config/nvim/backup'
o.undofile = true
o.undolevels = 1000
o.undoreload = 10000
o.backspace = 'indent,eol,start'
o.laststatus = 2
o.wildmode = 'list:longest,list:full'
o.ignorecase = true
o.showmatch = true
o.smartcase = true
o.winblend = 10
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.autoread = true
o.expandtab = true
o.list = true
o.listchars = 'tab:  ,trail:.'
o.ruler = true
o.linebreak = true
o.wrap = true
o.showbreak = '...'
o.history = 1000
o.foldlevelstart = 99
o.cmdheight = 1
o.updatetime = 50
o.timeoutlen = 0
o.ttimeoutlen = 0
o.clipboard = 'unnamedplus'
o.wildignore = '.git,.hg,node_modules,tmp'
o.signcolumn = 'yes:2'
o.updatetime = 2000
o.completeopt = "menuone,noselect"
o.number = true
o.hidden = true
o.termguicolors = true

g.mapleader = " "

opt.mouse = opt.mouse + "a"
opt.grepprg = "rg --vimgrep --no-heading --smart-case"
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

if term == 'screen' then
    o.ttymouse = "xterm2"
end
