local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup {
  ensure_installed = {
    'bash', 'c', 'c_sharp', 'clojure', 'comment', 'cpp', 'css', 'go',
    'html', 'javascript', 'json', 'jsonc', 'lua', 'python', 'regex',
    'rust', 'toml', 'typescript', 'yaml', 'fish'
  },
  highlight = {enable = true, use_languagetree = true},
  indent = {enable = true},
  incremental_selection = {enable = false},
  refactor = {
    highlight_definitions = {enable = true}
  }
}
