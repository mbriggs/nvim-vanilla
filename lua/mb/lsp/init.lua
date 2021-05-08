local config = require'lspconfig'
local nvim_root = '/Users/mbriggs/nvim'
local root_pattern = config.util.root_pattern

config.gopls.setup{
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      allowImplicitNetworkAccess = true,
      directory_files = {"-node_modules"},
      analyses = {
        unusedparams = true,
        nilness = true
      },
      staticcheck = true
    },
  },
}


config.html.setup{
  cmd = { "node", nvim_root.."/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  root_dir = function(fname)
    return root_pattern(fname) or vim.loop.os_homedir()
  end,
  settings = {
    html = {
      provideFormatter = true
    }
  }
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

config.dockerls.setup{}
config.bashls.setup{}
config.yamlls.setup{}
config.terraformls.setup{}
config.tsserver.setup{}
