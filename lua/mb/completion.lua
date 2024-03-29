local P = {}

function P.install(use)
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{
				"onsails/lspkind-nvim",
				config = function()
					require("lspkind").init({})
				end,
			},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"ray-x/cmp-treesitter",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			vim.api.nvim_exec(
				[[
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
  " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  " autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  " autocmd BufRead,BufNewFile *.md setlocal spell
  ]],
				true
			)

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "calc" },
					{ name = "treesitter" },
					{ name = "orgmode" },
				},
				documentation = {
					border = "rounded",
				},
				formatting = {
					format = function(_, vim_item)
						vim_item.kind = lspkind.presets.default[vim_item.kind]
						return vim_item
					end,
				},
			})
		end,
	})
end

return P
