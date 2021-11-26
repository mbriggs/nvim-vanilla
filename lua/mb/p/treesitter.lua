local ts_configs = require('nvim-treesitter.configs')

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

parser_config.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

ts_configs.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = {'org'},
  },
  indent = {enable = true},
  incremental_selection = {
    keymaps = {
      init_selection = '<C-D>',
      scope_incremental = '<C-S-D>',
      node_incremental = '<C-D>',
      node_decremental = '<S-D>'
    },
    enable = true
  },
  refactor = {
    highlight_definitions = {enable = true}
  },
  autotag = {
    enable = true,
  }
}
