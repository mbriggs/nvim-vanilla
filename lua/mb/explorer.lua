local P = {}

function P.install(use)
	-- use({
	-- 	"mcchrish/nnn.vim",
	-- 	config = function()
	-- 		local function copy_to_clipboard(lines)
	-- 			local joined_lines = table.concat(lines, "\n")
	-- 			vim.fn.setreg("+", joined_lines)
	-- 		end
	--
	-- 		require("nnn").setup({
	-- 			command = "nnn -o -e -r -C",
	-- 			set_default_mappings = 0,
	-- 			replace_netrw = 1,
	-- 			action = {
	-- 				["<c-t>"] = "tab split",
	-- 				["<c-s>"] = "split",
	-- 				["<c-v>"] = "vsplit",
	-- 				["<c-o>"] = copy_to_clipboard,
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v1.x",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("neo-tree").setup({
	-- 			popup_border_style = "rounded",
	-- 			filesystem = {
	-- 				window = {
	-- 					mappings = {
	-- 						["<2-LeftMouse>"] = "open",
	-- 						["<cr>"] = "open",
	-- 						["S"] = "open_split",
	-- 						["s"] = "open_vsplit",
	-- 						["C"] = "close_node",
	-- 						["<bs>"] = "navigate_up",
	-- 						["H"] = "toggle_hidden",
	-- 						["I"] = "toggle_gitignore",
	-- 						["R"] = "refresh",
	-- 						["/"] = "filter_as_you_type",
	-- 						["f"] = "filter_on_submit",
	-- 						["<c-x>"] = "clear_filter",
	-- 						["a"] = "add",
	-- 						["d"] = "delete",
	-- 						["r"] = "rename",
	-- 						["c"] = "copy_to_clipboard",
	-- 						["x"] = "cut_to_clipboard",
	-- 						["p"] = "paste_from_clipboard",
	-- 						["q"] = function()
	-- 							require("neo-tree").close_all()
	-- 						end,
	-- 					},
	-- 				},
	-- 				filters = {
	-- 					show_hidden = true,
	-- 					respect_gitignore = false,
	-- 				},
	-- 			},
	-- 		})
	-- 		vim.cmd([[nnoremap \ :NeoTreeFloatToggle<cr>]])
	-- 		vim.cmd([[nnoremap \\| :NeoTreeRevealToggle<cr>]])
	-- 		vim.cmd([[hi NeoTreeDirectoryIcon guibg=NONE guifg=#73cef4]])
	-- 	end,
	-- })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({
				disable_netrw = true,
				hijack_netrw = true,
				open_on_setup = false,
				ignore_ft_on_setup = {},
				auto_close = false,
				open_on_tab = false,
				hijack_cursor = false,
				update_cwd = false,
				update_to_buf_dir = {
					enable = true,
					auto_open = true,
				},
				diagnostics = {
					enable = false,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				update_focused_file = {
					enable = false,
					update_cwd = false,
					ignore_list = {},
				},
				system_open = {
					cmd = nil,
					args = {},
				},
				filters = {
					dotfiles = false,
					custom = {},
				},
				git = {
					enable = true,
					ignore = true,
					timeout = 500,
				},
				view = {
					width = 30,
					height = 30,
					hide_root_folder = false,
					side = "left",
					auto_resize = false,
					mappings = {
						custom_only = false,
						list = {},
					},
					number = false,
					relativenumber = false,
					signcolumn = "yes",
				},
				trash = {
					cmd = "trash",
					require_confirm = true,
				},
			})

			vim.cmd([[nnoremap \ :NvimTreeToggle<cr>]])
		end,
	})
end

return P
