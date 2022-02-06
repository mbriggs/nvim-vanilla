local P = {}

function P.install(use)
	use({
		"navarasu/onedark.nvim",
	})
	local cmd = vim.cmd
	local o = vim.o
	local g = vim.g

	cmd([[
" nvim-cmp visual studio code dark+ colors 

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  ]])

	cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
	cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

	o.termguicolors = true
	o.background = "dark"

	require("onedark").setup({
		-- Main options --
		style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- show the end-of-buffer tildes. By default they are hidden
		-- toggle theme style ---
		toggle_style_key = "<nop>", -- Default keybinding to toggle
		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
		},

		-- Custom Highlights --
		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl for diagnostics
			background = true, -- use background color for virtual text
		},
	})
	require("onedark").load()
end

return P
