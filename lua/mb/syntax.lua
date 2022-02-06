local P = {}

function P.install(use)
	-- git commits
	use("rhysd/committia.vim")

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = { [[windwp/nvim-ts-autotag]], [[RRethy/nvim-treesitter-endwise]] },
		run = ":TSUpdate",
		config = function()
			local ts_configs = require("nvim-treesitter.configs")

			ts_configs.setup({
				ensure_installed = "maintained",
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = { enable = true },
				incremental_selection = {
					keymaps = {
						init_selection = "<C-D>",
						scope_incremental = "<C-S-D>",
						node_incremental = "<C-D>",
						node_decremental = "<S-D>",
					},
					enable = true,
				},
				refactor = {
					highlight_definitions = { enable = true },
				},
				autotag = {
					enable = true,
				},
				endwise = {
					enable = true,
				},
			})
		end,
	})
end

return P
