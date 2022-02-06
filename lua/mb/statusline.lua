local P = {}

function P.install(use)
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "onedark",
			component_separators = { left = " ", right = " " },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "NvimTree" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = {},
			lualine_b = { "filename" },
			lualine_c = { "filesize", "diagnostics" },
			lualine_x = { "diff" },
			lualine_y = { "branch" },
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	})
end

return P
