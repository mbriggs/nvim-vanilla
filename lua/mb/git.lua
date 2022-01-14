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
		config = function()
			require("octo").setup()
		end,
	})
end

return P
