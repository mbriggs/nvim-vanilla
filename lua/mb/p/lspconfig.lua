local config = require'lspconfig'
local configs = require 'lspconfig/configs'
local nvim_root = '/Users/mbriggs/nvim'
local root_pattern = config.util.root_pattern


local on_attach = function(_, _)
  require'lsp_signature'.on_attach({
    bind = true,
    doc_lines = 10,
    floating_window = true,
    hint_enable = false,
    hint_scheme = "String",
    use_lspsaga = false,
    hi_parameter = "IncSearch",
    max_height = 12,
    max_width = 120,
    handler_opts = {
      border = "single"
    },
    extra_trigger_chars = {"(", ","}
  })
end

config.gopls.setup{
  on_attach = on_attach,
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
  on_attach = on_attach,
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
  on_attach = on_attach,
  cmd = { "node", nvim_root.."/vscode-json/json-language-features/server/dist/node/jsonServerMain.js", "--stdio" },
  filetypes = { 'json' },
  root_dir = root_pattern(".git", vim.fn.getcwd()),
  init_options = {
    provideFormatter = true,
  },
}


config.sumneko_lua.setup{
  on_attach = on_attach,
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
  on_attach = on_attach,
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

if not config.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = config.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "-p", "error,bugs,sql", "--out-format", "json" };
			}
		};
	}
end
config.golangcilsp.setup {
  on_attach = on_attach,
	filetypes = {'go'}
}

config.solargraph.setup{ on_attach = on_attach }
config.dockerls.setup{ on_attach = on_attach }
config.bashls.setup{ on_attach = on_attach }
config.yamlls.setup{ on_attach = on_attach }
config.terraformls.setup{ on_attach = on_attach }
config.tsserver.setup{ on_attach = on_attach }
