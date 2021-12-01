local P = { installed = false }

function P.null_config()
	require("null-ls").config({
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

	require("lspconfig")["null-ls"].setup({
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end
		end,
	})
end

function P.lsp_config()
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
end

function P.inst_config()
	local lsp_installer = require("nvim-lsp-installer")

	lsp_installer.on_server_ready(function(server)
		local function common_on_attach(client, bufnr)
			if server.name == "jsonls" or server.name == "tsserver" then
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end
		end

		local opts = {
			on_attach = common_on_attach,
		}

		server:setup(opts)
		vim.cmd([[ do User LspAttachBuffers ]])
	end)
end

function P.tbl_config()
	require("trouble").setup({})
end

function P.install(use)
	if P.installed then
		return
	end

	use({
		{ "neovim/nvim-lspconfig", config = P.lsp_config },
		"nvim-lua/lsp-status.nvim",
		{ "williamboman/nvim-lsp-installer", config = P.inst_config },
		{ "jose-elias-alvarez/null-ls.nvim", config = P.null_config },
		{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
		{ "folke/lsp-trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = P.tbl_config },
	})

	P.installed = true
end

return P
