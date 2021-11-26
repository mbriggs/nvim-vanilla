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

local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local go = require "nvim-lsp-installer.installers.go"
local gem = require "nvim-lsp-installer.installers.gem"
local servers = require "nvim-lsp-installer.servers"
local server = require "nvim-lsp-installer.server"
local path = require "nvim-lsp-installer.path"

local function golanglint()
  local server_name = "golangci-lint"

  configs[server_name] = {
      default_config = {
          cmd = {'golangci-lint-langserver'},
          init_options = {
              command = { "golangci-lint", "run", "-p", "bugs,error,sql", "--out-format", "json" };
          },
          filetypes = { "go" },
          root_dir = lspconfig.util.root_pattern "go.mod",
      },
  }


  local root_dir = server.get_server_root_path(server_name)
  local my_installer = go.packages { "github.com/nametake/golangci-lint-langserver@latest" }

  local my_server = server.Server:new {
      name = server_name,
      root_dir = root_dir,
      installer = my_installer,
      default_options = {
          cmd = { path.concat { root_dir, "golangci-lint-langserver" } },
      },
  }

  return my_server
end


servers.register(golanglint())
