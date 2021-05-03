
local function prettier() 
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = prettier,
    css = prettier,
    html = prettier,
    json = prettier,
    typescript = prettier,
  }
})
