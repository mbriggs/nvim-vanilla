require("astronauta.keymap")
local k = vim.keymap

-- enter clears hlsearch
k.nnoremap({ "<CR>", ":nohlsearch<CR>:w<CR>" })

-- qf
k.nmap({ "<c-n>", ":cn<cr>" })
k.nmap({ "<c-p>", ":cp<cr>" })

-- who needs loads of macro registers?
k.nnoremap({ "Q", "@q" })

-- %% for current dir
k.cnoremap({ "%%", "<C-R>=expand('%:h').'/'<cr>" })

-- front and back of a line
k.nnoremap({ "<s-h>", "^" })
k.nnoremap({ "<s-l>", "$" })

-- why isn't it this by default??
k.nnoremap({ "<s-y>", "y$" })
