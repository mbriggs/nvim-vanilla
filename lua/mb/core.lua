local P = { installed = false }

function P.dial_config()
	-- local dial = require("dial")
	--
	-- dial.config.searchlist.normal = {
	-- 	"number#decimal",
	-- 	"number#hex",
	-- 	"number#binary",
	-- 	"date#[%Y/%m/%d]",
	-- 	"markup#markdown#header",
	-- }
	vim.cmd([[
nmap <C-a> <Plug>(dial-increment)
nmap <C-x> <Plug>(dial-decrement)
vmap <C-a> <Plug>(dial-increment)
vmap <C-x> <Plug>(dial-decrement)
vmap g<C-a> <Plug>(dial-increment-additional)
vmap g<C-x> <Plug>(dial-decrement-additional)
  ]])
end

function P.rh_config()
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
	vim.g.cursorhold_updatetime = 10

	use({
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
		{
			"winston0410/range-highlight.nvim",
			requires = {
				"winston0410/cmd-parser.nvim",
			},
			config = P.rh_config,
		},
		{
			"monaqa/dial.nvim",
			config = P.dial_config,
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({
					disable_filetype = { "TelescopePrompt", "markdown" },
					map_bs = false,
					map_c_w = true,
				})
			end,
		},

		{
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
		},
		"kana/vim-textobj-user",
		"Julian/vim-textobj-variable-segment",
		"glts/vim-textobj-comment",
		"kana/vim-textobj-entire",
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

	P.installed = true
end

return P
