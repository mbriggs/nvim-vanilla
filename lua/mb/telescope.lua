local P = {}

function P.install(use)
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"fannheyward/telescope-coc.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = [[make]] },
		},
		cmd = [[Telescope]],
		config = function()
			local t = require("telescope")
			local actions = require("telescope.actions")

			t.setup({
				defaults = {
					file_ignore_patterns = { "node_modules/*" },
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				extensions = {
					fzf = {
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
				},
			})

			t.load_extension("fzf")
			-- t.load_extension('dap')
		end,
	})
end

return P
