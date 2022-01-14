local P = {}

function P.install(use)
	use({
		{
			"christoomey/vim-tmux-navigator",
			config = function()
				local g = vim.g
				local k = vim.keymap

				g.tmux_navigator_no_mappings = 1
				g.tmux_navigator_disable_when_zoomed = 1

				k.nnoremap({ "<c-f>h", ":TmuxNavigateLeft<cr>", silent = true })
				k.nnoremap({ "<c-f>j", ":TmuxNavigateDown<cr>", silent = true })
				k.nnoremap({ "<c-f>k", ":TmuxNavigateUp<cr>", silent = true })
				k.nnoremap({ "<c-f>l", ":TmuxNavigateRight<cr>", silent = true })
				k.nnoremap({ "<c-f><c-f>", ":TmuxNavigatePrevious<cr>", silent = true })

				k.tnoremap({ "<c-f>h", [[<c-\><c-n>:TmuxNavigateLeft<cr>]], silent = true })
				k.tnoremap({ "<c-f>j", [[<c-\><c-n>:TmuxNavigateDown<cr>]], silent = true })
				k.tnoremap({ "<c-f>k", [[<c-\><c-n>:TmuxNavigateUp<cr>]], silent = true })
				k.tnoremap({ "<c-f>l", [[<c-\><c-n>:TmuxNavigateRight<cr>]], silent = true })
				k.tnoremap({ "<c-f><c-f>", [[<c-\><c-n>:TmuxNavigatePrevious<cr>]], silent = true })
			end,
		},
		"jgdavey/tslime.vim",
	})
end

return P
