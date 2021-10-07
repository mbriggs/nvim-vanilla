local g = vim.g

g.nvim_tree_width = '20%'
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1

require('nvim-tree').setup {
  open_on_setup = true,
  hijack_cursor = true,
  view = {
    auto_resize = true
  }
}
