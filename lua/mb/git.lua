local P = {}

function P.install(use)
	use({
		"ruifm/gitlinker.nvim",
		config = function()
			require("gitlinker").setup()
		end,
	})
	use({ "rhysd/git-messenger.vim", cmd = [[GitMessenger]] })
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ "kdheepak/lazygit.nvim", cmd = "LazyGit" })
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup({
				default_remote = { "upstream", "origin" }, -- order to try remotes
				reaction_viewer_hint_icon = "", -- marker for user reactions
				user_icon = " ", -- user icon
				timeline_marker = "", -- timeline marker
				timeline_indent = "2", -- timeline indentation
				right_bubble_delimiter = "", -- Bubble delimiter
				left_bubble_delimiter = "", -- Bubble delimiter
				github_hostname = "", -- GitHub Enterprise host
				snippet_context_lines = 4, -- number or lines around commented lines
				file_panel = {
					size = 10, -- changed files panel rows
					use_icons = true, -- use web-devicons in file panel
				},
			})
		end,
	})
end

return P
