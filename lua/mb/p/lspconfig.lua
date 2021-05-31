local config = require'lspconfig'
local nvim_root = '/Users/mbriggs/nvim'
local root_pattern = config.util.root_pattern

config.gopls.setup{
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      allowImplicitNetworkAccess = true,
      analyses = {
        unusedparams = true,
        nilness = true
      },
      staticcheck = true
    },
  },
}

config.cssls.setup{
  cmd = { "node", nvim_root.."/vscode-css/css-language-features/server/dist/node/cssServerMain.js", "--stdio" },
  filetypes = { 'css', 'less', 'scss' },
  root_dir = root_pattern("package.json"),
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}

config.jsonls.setup{
  cmd = { "node", nvim_root.."/vscode-json/json-language-features/server/dist/node/jsonServerMain.js", "--stdio" },
  filetypes = { 'json' },
  root_dir = root_pattern(".git", vim.fn.getcwd()),
  init_options = {
    provideFormatter = true,
  },
}


config.sumneko_lua.setup{
  cmd = { nvim_root.."/lua-language-server/bin/macOS/lua-language-server", "-E", nvim_root.."/lua-language-server/main.lua" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = root_pattern(".git"),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 2000,
        preloadFileSize = 1000
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

config.vuels.setup{
  cmd = { "/opt/homebrew/bin/vls" },
  filetypes = { "vue" },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {}
      },
      vetur = {
        completion = {
          autoImport = false,
          tagCasing = "kebab",
          useScaffoldSnippets = false
        },
        format = {
          defaultFormatter = {
            js = "none",
            ts = "none"
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true
        }
      }
    }
  },
  root_dir = root_pattern("package.json", "vue.config.js")
}

config.solargraph.setup{}
config.dockerls.setup{}
config.bashls.setup{}
config.yamlls.setup{}
config.terraformls.setup{}
config.tsserver.setup{}
