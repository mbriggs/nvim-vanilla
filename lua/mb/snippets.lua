local P = {}

function P.install(use)
	use({
		"hrsh7th/vim-vsnip",
		config = function()
			local k = vim.keymap

			-- expand
			k.imap({ "<c-j>", [[vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<c-j>']], expr = true })
			k.smap({ "<c-j>", [[vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<c-j>']], expr = true })

			-- " Expand or jump
			k.imap({ "<c-l>", [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<c-l>']], expr = true })
			k.smap({ "<c-l>", [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<c-l>']], expr = true })

			-- " Jump forward or backward
			k.imap({ "<Tab>", [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], expr = true })
			k.smap({ "<Tab>", [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], expr = true })
			k.imap({ "<S-Tab>", [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], expr = true })
			k.smap({ "<S-Tab>", [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], expr = true })
		end,
	})
end

return P
