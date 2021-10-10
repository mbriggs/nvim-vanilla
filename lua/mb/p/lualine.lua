local colors = mb.colors

-- local colors = {
--     none = "NONE",
--     bg = "#282c34",
--     bg2 = "#21252b",
--     bg_visual = "#393f4a",
--     border = "#646e82",
--     bg_highlight = "#242b38",
--     fg = "#abb2bf",
--     fg_light = "#adbac7",
--     fg_dark = "#798294",
--     fg_gutter = "#5c6370",
--     dark5 = "#abb2bf",
--     blue = "#61afef",
--     cyan = "#56b6c2",
--     purple = "#c678dd",
--     orange = "#d19a66",
--     yellow = "#e0af68",
--     yellow2 = "#e2c08d",
--     bg_yellow = "#ebd09c",
--     green = "#98c379",
--     red = "#e86671",
--     red1 = "#f65866",
--     git = { change = "#e0af68", add = "#109868", delete = "#9A353D", conflict = "#bb7a61" },
--     gitSigns = { change = "#e0af68", add = "#109868", delete = "#9A353D" },
--     diagnostics = {
--       error = "#db4b4b",
--       hint = "#1abc9c",
--       info = "#0db9d7",
--       warn = "#e0af68",
--     },
--   }



local color_style = { bg = colors.bg_statusline, fg = colors.fg_dark }
local style = { a = color_style, b = color_style, c = color_style, }

local theme = {
  normal = style,
  insert = style,
  command = style,
  visual = style,
  replace = style,
  inactive = style,
}

require('lualine').setup {
  options = {
    theme = theme,
    section_separators = {'', ''},
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
        padding = 3,
        sources = {'nvim_lsp'},
        color_error = color_style.fg,
        color_warn = color_style.fg,
        color_info = color_style.fg,
        color_hint = color_style.fg,
      }
    },

    lualine_x = {
    },

    lualine_y = {
      {
        'diff',
        padding = 3,
        colored = false,
        symbols = {
          added = '+',
          modified = '~',
          removed = '-',
        },
      },
    },

    lualine_z = {
      'branch'
    },
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
