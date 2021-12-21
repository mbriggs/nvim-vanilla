local P = { installed = false }

function P.tbl_config()
	require("trouble").setup({})
end


function P.install(use)
	if P.installed then
		return
	end

  vim.g.coc_global_extensions = {
    "coc-calc", "coc-cmake", "coc-css", "coc-eslint", "coc-go", "coc-html", "coc-htmlhint", "coc-html-css-support", "coc-json", "coc-lightbulb", "coc-prettier", 
    "coc-sh", "coc-stylelint", "coc-spell-checker", "coc-sqlfluff", "coc-sumneko-lua","coc-svg", "coc-tailwindcss", "coc-tsserver", "coc-yaml", "coc-zls", "coc-toml", "coc-solargraph", "coc-lists", "coc-snippets", "coc-git"
  }

	use({
		{ "neoclide/coc.nvim", branch = "release" },
		{ "folke/lsp-trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = P.tbl_config },
	})

	P.installed = true
end

return P
