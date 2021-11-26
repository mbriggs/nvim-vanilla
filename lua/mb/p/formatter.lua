local function goimports()
  return {
    exe = "goimports",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

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
    javascript = { prettier },
    css = { prettier },
    html = { prettier },
    json = { prettier },
    typescript = { prettier },
    -- go = { goimports },
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.css,*.html,*.json,*.ts,*.tsx FormatWrite
augroup END
]], true)
