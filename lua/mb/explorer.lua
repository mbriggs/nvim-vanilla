local P = { installed = false }

local g = vim.g

local function nnn_config()
  local function copy_to_clipboard(lines)
    local joined_lines = table.concat(lines, "\n")
    vim.fn.setreg("+", joined_lines)
  end

  require("nnn").setup({
    command = "nnn -o -e -r -C",
    set_default_mappings = 0,
    replace_netrw = 1,
    action = {
      ["<c-t>"] = "tab split",
      ["<c-s>"] = "split",
      ["<c-v>"] = "vsplit",
      ["<c-o>"] = copy_to_clipboard,
    },
  })
end

function P.install(use)
  use {
    'mcchrish/nnn.vim',
    config = nnn_config,
  }
end

return P
