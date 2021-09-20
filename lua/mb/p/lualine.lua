require('lualine').setup {
  options = {
    theme = 'github',
    section_separators = {'', ''},
    component_separators = {'', ''}
  },

  sections = {
    lualine_a = {
      {
        'filename',
        file_status = true,
        path = 1
      }
    },

    lualine_b = {},

    lualine_c = {
      {
        'diagnostics',
        sources = {'nvim_lsp'},
      }
    },

    lualine_x = {
      {
        'diff',
        symbols = {
          added = '+',
          modified = '~',
          removed = '-',
        },
      },
      'branch'
    },

    lualine_y = {
    },

    lualine_z = {},
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    'nvim-tree',
    'quickfix'
  }
}
