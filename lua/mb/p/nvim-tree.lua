local k = vim.keymap
local g = vim.g

k.nnoremap{ '<leader>bb', ':NvimTreeToggle<CR>' }
k.nnoremap{ '<leader>br', ':NvimTreeRefresh<CR>' }
k.nnoremap{ '<leader>bf', ':NvimTreeFindFile<CR>' }


g.nvim_tree_width = '20%'
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_hijack_cursor = 1

