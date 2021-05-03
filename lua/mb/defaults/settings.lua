local os = require'os'

local home = os.getenv('HOME')

vim.o.inccommand = 'nosplit'
vim.o.number = true
vim.o.exrc = true
vim.o.secure = true
vim.o.splitright = true
vim.o.showcmd = true
vim.o.backupdir = home .. '/.config/nvim/backup'
vim.o.directory = home .. '/.config/nvim/backup'
vim.o.undodir = home .. '/.config/nvim/backup'
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.o.backspace = 'indent,eol,start'
vim.o.laststatus = 2
vim.o.wildmode = 'list:longest,list:full'
vim.o.ignorecase = true
vim.o.showmatch = true
vim.o.smartcase = true
vim.o.winblend = 10
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoread = true
vim.o.expandtab = true
vim.o.list = true
vim.o.listchars = 'trail:.'
vim.o.ruler = true
vim.o.linebreak = true
vim.o.wrap = true
vim.o.showbreak = '...'
vim.o.confirm = true
vim.o.history = 1000
vim.o.foldlevelstart = 99
vim.o.cmdheight = 1
vim.o.updatetime = 50
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0
vim.o.clipboard = 'unnamedplus'
vim.o.wildignore = '.git,.hg,node_modules,tmp'
vim.o.signcolumn = 'yes:2'
vim.o.updatetime = 2000
vim.o.completeopt = "menuone,noselect"

vim.g.mapleader = " "

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
