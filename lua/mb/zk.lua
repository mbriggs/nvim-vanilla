local P = { installed = false }

function P.config()
	require("zk").setup()
end

function P.today()
	require("zk").new(nil, { date = "today", dir = "journal/daily" })
end

function P.yesterday()
	require("zk").new(nil, { date = "yesterday", dir = "journal/daily" })
end

function P.thisWeek()
	require("zk").new(nil, { date = "today", dir = "journal/weekly" })
end

function P.lastWeek()
	require("zk").new(nil, { date = "last week", dir = "journal/weekly" })
end

function P.project()
	local currentProject = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	require("zk").new(nil, { title = currentProject, dir = "project" })
end

function P.reindex()
	require("zk").index(nil)
end

function P.install(use)
	if P.installed then
		return
	end

	use({
		"mickael-menu/zk-nvim",
		requires = { "neovim/nvim-lspconfig" },
		config = P.config,
	})

	P.installed = true
end

return P
