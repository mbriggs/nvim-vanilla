local P = {}

function P.install(use)
	local g = vim.g

	g.matchup_matchparen_offscreen = { method = "popup" }
	g.cursorhold_updatetime = 10

	use({
		"ironhouzi/starlite-nvim",
		config = function()
			local k = vim.keymap
			local starlite = require("starlite")

			k.nnoremap({
				"*",
				function()
					starlite.star()
				end,
				silent = true,
			})
			k.nnoremap({
				"g*",
				function()
					starlite.g_star()
				end,
				silent = true,
			})
			k.nnoremap({
				"#",
				function()
					starlite.hash()
				end,
				silent = true,
			})
			k.nnoremap({
				"g#",
				function()
					starlite.g_hash()
				end,
				silent = true,
			})
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*", -- Highlight all files, but customize some others.
				css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
				html = { names = false }, -- Disable parsing "names" like Blue or Gray
			})
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				padding = true,
			})
		end,
	})

	use({
		"ojroques/nvim-bufdel",
		config = function()
			require("bufdel").setup({
				next = "alternate",
				quit = false,
			})
		end,
	})

	use({
		"janko/vim-test",
		requires = "preservim/vimux",
		config = [[vim.g['test#strategy'] = 'vimux']],
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = [[require'todo-comments'.setup{}]],
	})

	use({
		"kevinhwang91/nvim-bqf",
		requires = {
			{ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
			"junegunn/fzf.vim",
		},
		config = function()
			require("bqf").setup({
				auto_enable = true,
			})
		end,
	})

	use({
		"andymass/vim-matchup",
		config = function()
			require("nvim-treesitter.configs").setup({
				matchup = { enable = true },
			})
		end,
	})

	use({
		"sindrets/winshift.nvim",
		config = function()
			require("winshift").setup({
				highlight_moving_win = true, -- Highlight the window being moved
				focused_hl_group = "Visual", -- The highlight group used for the moving window
				moving_win_options = {
					-- These are local options applied to the moving window while it's
					-- being moved. They are unset when you leave Win-Move mode.
					wrap = false,
					cursorline = false,
					cursorcolumn = false,
					colorcolumn = "",
				},
				-- The window picker is used to select a window while swapping windows with
				-- ':WinShift swap'.
				-- A string of chars used as identifiers by the window picker.
				window_picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				window_picker_ignore = {
					-- This table allows you to indicate to the window picker that a window
					-- should be ignored if its buffer matches any of the following criteria.
					filetype = { -- List of ignored file types
						"NvimTree",
					},
					buftype = { -- List of ignored buftypes
						"terminal",
						"quickfix",
					},
					bufname = { -- List of regex patterns matching ignored buffer names
						[[.*foo/bar/baz\.qux]],
					},
				},
			})
		end,
	})

	use({
		"sQVe/sort.nvim",
		config = function()
			require("sort").setup({
				delimiters = {
					",",
					"|",
					";",
					":",
					"s", -- Space
					"t", -- Tab
				},
			})
		end,
	})

	use({
		"winston0410/range-highlight.nvim",
		requires = {
			"winston0410/cmd-parser.nvim",
		},
		config = function()
			require("range-highlight").setup({
				highlight = "Visual",
				highlight_with_out_range = {
					d = true,
					delete = true,
					m = true,
					move = true,
					y = true,
					yank = true,
					c = true,
					change = true,
					j = true,
					join = true,
					["<"] = true,
					[">"] = true,
					s = true,
					subsititue = true,
					sno = true,
					snomagic = true,
					sm = true,
					smagic = true,
					ret = true,
					retab = true,
					t = true,
					co = true,
					copy = true,
					ce = true,
					center = true,
					ri = true,
					right = true,
					le = true,
					left = true,
					sor = true,
					sort = true,
				},
			})
		end,
	})

	use({
		"monaqa/dial.nvim",
		config = function()
			vim.cmd([[
nmap <C-a> <Plug>(dial-increment)
nmap <C-x> <Plug>(dial-decrement)
vmap <C-a> <Plug>(dial-increment)
vmap <C-x> <Plug>(dial-decrement)
vmap g<C-a> <Plug>(dial-increment-additional)
vmap g<C-x> <Plug>(dial-decrement-additional)
  ]])
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "markdown" },
				map_bs = false,
				map_c_w = true,
			})
		end,
	})

	use({
		"ConradIrwin/vim-bracketed-paste",
		"google/vim-searchindex",
		"justinmk/vim-gtfo",
		"lambdalisue/reword.vim",
		"lambdalisue/suda.vim",
		"lambdalisue/vim-protocol",
		"machakann/vim-highlightedyank",
		"tpope/vim-afterimage",
		"tpope/vim-apathy",
		"tpope/vim-jdaddy",
		"tpope/vim-repeat",
		"tpope/vim-surround",
		"tpope/vim-unimpaired",
		"antoinemadec/FixCursorHold.nvim",
	})
end

return P
