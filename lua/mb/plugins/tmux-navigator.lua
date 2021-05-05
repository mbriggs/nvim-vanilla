vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

nnoremap('<c-f>h', ':TmuxNavigateLeft<cr>')
nnoremap('<c-f>j', ':TmuxNavigateDown<cr>')
nnoremap('<c-f>k', ':TmuxNavigateUp<cr>')
nnoremap('<c-f>l', ':TmuxNavigateRight<cr>')
nnoremap('<c-f><c-f>', ':TmuxNavigatePrevious<cr>')
