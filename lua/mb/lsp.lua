local P = {}

function P.install(use)
	use({
		"neovim/nvim-lspconfig",
		config = function()
			local utils = require("lspconfig.util")

			require("lspconfig").solargraph.setup({
				cmd = { "solargraph", "stdio" },
				filetypes = { "ruby" },
				init_options = {
					formatting = true,
					useBundler = true,
				},
				on_attach = function(client, bufnr)
					client.resolved_capabilities.document_formatting = false
					client.resolved_capabilities.document_range_formatting = false
				end,
				root_dir = utils.root_pattern("Gemfile", ".git"),
				settings = {
					solargraph = {
						diagnostics = true,
						formatting = true,
						useBundler = true,
					},
				},
			})
		end,
	})

	use({
		"williamboman/nvim-lsp-installer",
		config = function()
			local lsp_installer = require("nvim-lsp-installer")

			lsp_installer.on_server_ready(function(server)
				local function common_on_attach(client, bufnr)
					require("lsp_signature").on_attach({
						bind = true, -- This is mandatory, otherwise border config won't get registered.
						handler_opts = {
							border = "rounded",
						},
					}, bufnr)
					if server.name == "jsonls" or server.name == "tsserver" then
						client.resolved_capabilities.document_formatting = false
						client.resolved_capabilities.document_range_formatting = false
					end
				end

				local opts = {
					on_attach = common_on_attach,
					handlers = {
						["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
					},
				}
				vim.cmd([[
      highlight DiagnosticLineNrError guibg=#6b0f17 guifg=#993939 gui=bold
      highlight DiagnosticLineNrWarn guibg=#49340e guifg=#93691d gui=bold
      highlight DiagnosticLineNrInfo guibg=#15373b guifg=#2b6f77 gui=bold
      highlight DiagnosticLineNrHint guibg=#441f4f guifg=#8a3fa0 gui=bold

      sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
      sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
      sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
      sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
    ]])
				vim.diagnostic.config({
					virtual_text = false,
					float = {
						header = false,
						source = false,
						border = "rounded",
					},
				})
				server:setup(opts)
				vim.cmd([[ do User LspAttachBuffers ]])
				vim.cmd(
					[[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border=rounded})]]
				)
			end)
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				on_attach = function(client)
					if client.resolved_capabilities.document_formatting then
						vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
					end
				end,
				sources = {
					require("null-ls").builtins.formatting.cmake_format,
					require("null-ls").builtins.formatting.codespell,
					require("null-ls").builtins.formatting.fish_indent,
					require("null-ls").builtins.formatting.goimports,
					require("null-ls").builtins.formatting.rufo,
					require("null-ls").builtins.formatting.prettierd,
					require("null-ls").builtins.formatting.shfmt,
					require("null-ls").builtins.formatting.sqlformat,
					require("null-ls").builtins.formatting.stylelint,
					require("null-ls").builtins.formatting.stylua,
					require("null-ls").builtins.diagnostics.eslint_d,
					require("null-ls").builtins.diagnostics.hadolint,
					require("null-ls").builtins.diagnostics.proselint,
					require("null-ls").builtins.diagnostics.shellcheck,
					require("null-ls").builtins.diagnostics.stylelint,
					require("null-ls").builtins.diagnostics.golangci_lint,
					require("null-ls").builtins.code_actions.proselint,
				},
			})
		end,
	})

	use({
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({

		"nvim-lua/lsp-status.nvim",
		"ray-x/lsp_signature.nvim",
	})
end

return P
