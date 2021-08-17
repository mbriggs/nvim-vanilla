require('eval').setup({
  prefix_char = ">",
  filetype = {
    lua = { cmd = "lua" },
    javascript = { cmd = "node" },
    ruby = { cmd = "ruby" },
    go = { cmd = "gore" },
  }
})
