local colors = {
  blue = {
    dark = "#3b8eea",
    dimmed = "#6cb6ff",
    light = "#0451a5",
    dark_default = "#58a6ff",
    light_default = "#0366d6"
  },
  bg = {
    dark = "#24292e",
    dimmed = "#22272e",
    light = "#ffffff",
    dark_default = "#0d1117",
    light_default = "#ffffff"
  },
  git = {
    add = {
      dark = "#34d058",
      dimmed = "#6bc46d",
      light = "#28a745",
      dark_default = "#56d364",
      light_default = "#22863a"
    },
    change = {
      dark = "#79b8ff",
      dimmed = "#daaa3f",
      light = "#005cc8",
      dark_default = "#ac8934",
      light_default = "#b08800"
    },
    delete = {
      dark = "#ea4a5a",
      dimmed = "#b34642",
      light = "#d73a49",
      dark_default = "#f85149",
      light_default = "#cb2431"
    },
  },
  diag = {
    error = {
      dark = "#f97583",
      dimmed = "#e5534b",
      light = "#cb2431",
      dark_default = "#f85149",
      light_default = "#cb2431"
    },
    warning = {
      dark = "#cca700",
      dimmed = "#cca700",
      light = "#bf8803",
      dark_default = "#f0883e",
      light_default = "#bf8803"
    },
    info = "#75beff",
    hint = {
      dark = "#eeeeb3",
      dimmed = "#eeeeb3",
      light = "#6c6c6c",
      dark_default = "#eeeeb3",
      light_default = "#6c6c6c"
    },
  }
}

local function style(var)
  local color_style = { bg = colors.blue[var], fg = colors.bg[var] }
  return { a = color_style, b = color_style, c = color_style, }
end

local theme = {
  normal = style("light_default"),
  insert = style("light_default"),
  command = style("light_default"),
  visual = style("light_default"),
  replace = style("light_default"),
  inactive = style("dimmed"),
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
        color_error = colors.bg['light_default'],
        color_warn = colors.bg['light_default'],
        color_info = colors.bg['light_default'],
        color_hint = colors.bg['light_default'],
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
    lualine_a = {
      {
        'filename',
         file_status = true,
         path = 1
      }
    },
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
