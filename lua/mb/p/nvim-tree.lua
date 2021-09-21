local wk = require('which-key')
local g = vim.g

wk.register({
  ['<leader>b'] = {
    name = '+tree',
    b = { ':NvimTreeToggle<CR>', 'Toggle Tree' },
    r = { ':NvimTreeRefresh<CR>', 'Refresh Tree' },
    f = { ':NvimTreeFindFile<CR>', 'Find Current File In Tree' },
  }
})


g.nvim_tree_width = '20%'
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_hijack_cursor = 1

