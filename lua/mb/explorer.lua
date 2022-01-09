local P = { installed = false }

local g = vim.g

local function nnn_config()
	local function copy_to_clipboard(lines)
		local joined_lines = table.concat(lines, "\n")
		vim.fn.setreg("+", joined_lines)
	end

	require("nnn").setup({
		command = "nnn -o -e -r -C",
		set_default_mappings = 0,
		replace_netrw = 1,
		action = {
			["<c-t>"] = "tab split",
			["<c-s>"] = "split",
			["<c-v>"] = "vsplit",
			["<c-o>"] = copy_to_clipboard,
		},
	})
end

function P.install(use)
	use({
		"mcchrish/nnn.vim",
		config = nnn_config,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				popup_border_style = "rounded",
				filesystem = {
					window = {
						mappings = {
							["<2-LeftMouse>"] = "open",
							["<cr>"] = "open",
							["S"] = "open_split",
							["s"] = "open_vsplit",
							["C"] = "close_node",
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["I"] = "toggle_gitignore",
							["R"] = "refresh",
							["/"] = "filter_as_you_type",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["a"] = "add",
							["d"] = "delete",
							["r"] = "rename",
							["c"] = "copy_to_clipboard",
							["x"] = "cut_to_clipboard",
							["p"] = "paste_from_clipboard",
						},
					},
				},
			})
			vim.cmd([[nnoremap \ :NeoTreeReveal<cr>]])
		end,
	})
end

return P
