local g = vim.g
local k = vim.keymap

g.tmux_navigator_no_mappings = 1
g.tmux_navigator_disable_when_zoomed = 1

k.nnoremap{ '<c-f>h', ':TmuxNavigateLeft<cr>' }
k.nnoremap{ '<c-f>j', ':TmuxNavigateDown<cr>' }
k.nnoremap{ '<c-f>k', ':TmuxNavigateUp<cr>' }
k.nnoremap{ '<c-f>l', ':TmuxNavigateRight<cr>' }
k.nnoremap{ '<c-f><c-f>', ':TmuxNavigatePrevious<cr>' }
