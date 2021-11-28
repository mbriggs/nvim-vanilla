local P = { installed = false }

local function inst_config()
  local lsp_installer = require("nvim-lsp-installer")

  local function common_on_attach(client, bufnr)
  end

  vim.api.nvim_exec([[
  augroup LSPFormat
    autocmd!
    autocmd BufWritePre *.rb,Gemfile,*.go lua vim.lsp.buf.formatting_sync()
  augroup END
  ]], true)

  lsp_installer.on_server_ready(function(server)
      local opts = {
          on_attach = common_on_attach,
      }

      -- (optional) Customize the options passed to the server
      -- if server.name == "tsserver" then
      --     opts.root_dir = function() ... end
      -- end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

local function tbl_config()
  require"trouble".setup {}
end


function P.install(use)
  if P.installed then
    return
  end

  use {
    'neovim/nvim-lspconfig',
    'nvim-lua/lsp-status.nvim',
    { 'williamboman/nvim-lsp-installer', config = inst_config },
    { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
    { 'folke/lsp-trouble.nvim', requires = "kyazdani42/nvim-web-devicons", config = tbl_config },
  }

  P.installed = true
end

return P
