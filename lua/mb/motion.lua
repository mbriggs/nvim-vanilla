local P = {}

function P.install(use)
	use({
		"rlane/pounce.nvim",
		config = function()
			local k = vim.keymap
			k.nmap({ "s", "<cmd>Pounce<CR>" })
			k.vmap({ "s", "<cmd>Pounce<CR>" })
			k.omap({ "gs", "<cmd>Pounce<CR>" })

			require("pounce").setup({
				accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
				debug = false,
			})
		end,
	})
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({
				tabkey = "", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
					{ open = "do", close = "end" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})

			local function replace_keycodes(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end

			function _G.tab_binding()
				if require("cmp").visible() then
					return replace_keycodes("<C-n>")
				elseif vim.fn["vsnip#available"](1) ~= 0 then
					return replace_keycodes("<Plug>(vsnip-expand-or-jump)")
				else
					return replace_keycodes("<Plug>(Tabout)")
				end
			end

			function _G.s_tab_binding()
				if require("cmp").visible() then
					return replace_keycodes("<C-p>")
				elseif vim.fn["vsnip#jumpable"](-1) ~= 0 then
					return replace_keycodes("<Plug>(vsnip-jump-prev)")
				else
					return replace_keycodes("<Plug>(TaboutBack)")
				end
			end

			vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", { expr = true })
			vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", { expr = true })
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		-- after = { "completion-nvim" }, -- if a completion plugin is using tabs load it before
	})
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	use({ "rhysd/vim-textobj-anyblock", requires = "kana/vim-textobj-user" })
	use({ "chaoren/vim-wordmotion", setup = [[vim.g.wordmotion_prefix = '<space>']] })
	use({
		"yuttie/comfortable-motion.vim",
		config = function()
			local k = vim.keymap
			k.noremap({ "<ScrollWheelDown>", ":call comfortable_motion#flick(10)<CR>", silent = true })
			k.noremap({ "<ScrollWheelUp>", ":call comfortable_motion#flick(-10)<CR>", silent = true })
		end,
	})
	use({
		"kana/vim-textobj-user",
		"kana/vim-niceblock",
		"Julian/vim-textobj-variable-segment",
		"glts/vim-textobj-comment",
		"kana/vim-textobj-entire",
	})
end

return P
