local P = { installed = false }

function P.ap_config()
	local ap = require("nvim-autopairs")

	ap.setup({})
	ap.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
	ap.add_rules(require("nvim-autopairs.rules.endwise-lua"))
	ap.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

	require("nvim-autopairs").setup({
		map_cr = true, --  map <CR> on insert mode
		map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
		auto_select = true, -- automatically select the first item
		insert = false, -- use insert confirm behavior instead of replace
		map_char = { -- modifies the function or method delimiter by filetypes
			all = "(",
			tex = "{",
		},
	})
end

function P.ws_config()
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
end

function P.mu_config()
	require("nvim-treesitter.configs").setup({
		matchup = { enable = true },
	})
end

function P.sl_config()
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
end

function P.clr_config()
	require("colorizer").setup({
		"*", -- Highlight all files, but customize some others.
		css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
		html = { names = false }, -- Disable parsing "names" like Blue or Gray
	})
end

function P.cmnt_config()
	require("Comment").setup({
		padding = true,
	})
end

function P.numb_config()
	require("numb").setup()
end

function P.hop_config()
	local hop = require("hop")
	local dir = require("hop.hint").HintDirection
	local k = vim.keymap

	hop.setup()

	k.nnoremap({
		"s",
		function()
			hop.hint_char2({ direction = dir.AFTER_CURSOR })
		end,
	})
	k.nnoremap({
		"S",
		function()
			hop.hint_char2({ direction = dir.BEFORE_CURSOR })
		end,
	})
	k.nnoremap({
		"gs",
		function()
			hop.hint_char1({ direction = dir.AFTER_CURSOR })
		end,
	})
	k.nnoremap({
		"gS",
		function()
			hop.hint_char1({ direction = dir.BEFORE_CURSOR })
		end,
	})
	k.nnoremap({
		"gl",
		function()
			hop.hint_lines()
		end,
	})

	k.vnoremap({
		"s",
		function()
			hop.hint_char2({ direction = dir.AFTER_CURSOR })
		end,
	})
	k.vnoremap({
		"S",
		function()
			hop.hint_char2({ direction = dir.BEFORE_CURSOR })
		end,
	})
	k.vnoremap({
		"gs",
		function()
			hop.hint_char1({ direction = dir.AFTER_CURSOR })
		end,
	})
	k.vnoremap({
		"gS",
		function()
			hop.hint_char1({ direction = dir.BEFORE_CURSOR })
		end,
	})
	k.vnoremap({
		"gl",
		function()
			hop.hint_lines()
		end,
	})
end

function P.bd_config()
	require("bufdel").setup({
		next = "alternate",
		quit = false,
	})
end

function P.bqf_config()
	require("bqf").setup({
		auto_enable = true,
	})
end

function P.install(use)
	if P.installed then
		return
	end

	-- required for matchup
	require("mb.syntax").install(use)

	vim.g.matchup_matchparen_offscreen = { method = "popup" }

	use({
		{ "windwp/nvim-autopairs", config = P.ap_config },
		{ "ironhouzi/starlite-nvim", config = P.sl_config },
		{ "nacro90/numb.nvim", config = P.numb_config },
		{ "norcalli/nvim-colorizer.lua", config = P.clr_config },
		{ "numToStr/Comment.nvim", config = P.cmnt_config },
		{ "phaazon/hop.nvim", config = P.hop_config },
		{ "ojroques/nvim-bufdel", config = P.bd_config },
		{
			"janko/vim-test",
			requires = "preservim/vimux",
			config = [[vim.g['test#strategy'] = 'vimux']],
		},
		{
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = [[require'todo-comments'.setup{}]],
		},
		{
			"kevinhwang91/nvim-bqf",
			requires = {
				{ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
				"junegunn/fzf.vim",
			},
			config = P.bqf_config,
		},
		{ "andymass/vim-matchup", config = P.mu_config },
		{ "sindrets/winshift.nvim", config = P.ws_config },
		{
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
		},
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
	})

	P.installed = true
end

return P
