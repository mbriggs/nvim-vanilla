local lsp_installer = require("nvim-lsp-installer")

local function common_on_attach(client, bufnr)
    -- ... set up buffer keymaps, etc.
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


vim.api.nvim_exec([[
augroup LSPFormat
  autocmd!
  autocmd BufWritePre *.rb,Gemfile lua vim.lsp.buf.formatting_sync()
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
