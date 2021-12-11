local P = { installed = false }

local o = vim.o
local opt = vim.opt

function P.wk_config()
	local wk = require("which-key")
	local gl = require("gitlinker")
	local gla = require("gitlinker.actions")

	wk.register({
		["<leader>"] = {
			[";"] = { [[<cmd>Telescope find_files<cr>]], "Find File" },
			["<space>"] = { [[<cmd>Telescope oldfiles<cr>]], "Find Old File" },
			["-"] = { [[<cmd>only<cr>]], "Close other splits" },
			["'"] = { [[<cmd>vs<cr>]], "Split" },
			['"'] = { [[<cmd>sp<cr>]], "Horizontal Split" },
			["."] = { [[<cmd>Telescope lsp_definitions<cr>]], "Go to Definition" },
			[","] = { "<cmd>NnnPicker %:p:h<cr>", "File Picker" },
			["|"] = { "<cmd>NnnExplorer %:p:h<cr>", "Explore Files" },
			["/"] = {
				function()
					print("Current Buffer: " .. vim.api.nvim_buf_get_name(0))
				end,
				"Current Buffer",
			},
			f = {
				name = "+find",
				b = { [[<cmd>Telescope current_buffer_fuzzy_find<cr>]], "Find within buffer" },
				k = { [[<cmd>Telescope dap list_breakpoints<cr>]], "Find Breakpoints" },
				r = { [[<cmd>Telescope lsp_references<cr>]], "Find References" },
				i = { [[<cmd>Telescope lsp_implementations<cr>]], "Find Implementations" },
				f = { [[<cmd>Telescope live_grep<cr>]], "Live Grep" },
				t = { [[<cmd>Telescope filetypes<cr>]], "Filetypes" },
				s = { [[<cmd>Telescope search_history<cr>]], "Previous Searches" },
				g = { [[<cmd>Telescope git_files<cr>]], "Git Files" },
				m = { [[<cmd>Telescope lsp_document_symbols<cr>]], "Document Symbols" },
				w = { [[<cmd>Telescope lsp_dynamic_workspace_symbols<cr>]], "Workspace Symbols" },
			},
			h = {
				name = "+github",
				p = {
					name = "+pr",
					n = { [[<cmd>Octo pr create<cr>]], "Create PR" },
					l = { [[<cmd>Octo pr list<cr>]], "List Open PRs" },
					o = { [[<cmd>Octo pr checkout<cr>]], "Checkout current PR" },
					e = { [[<cmd>Octo pr edit<cr>]], "Edit PR" },
					m = { [[<cmd>Octo pr merge<cr>]], "Merge PR" },
					c = { [[<cmd>Octo pr commits<cr>]], "PR Commits" },
					k = { [[<cmd>Octo pr checks<cr>]], "State of PR Checks" },
					d = { [[<cmd>Octo pr diff<cr>]], "PR Diff" },
					b = { [[<cmd>Octo pr browser<cr>]], "Open PR in Browser" },
					y = { [[<cmd>Octo pr url<cr>]], "Copy PR URL to clipboard" },
					r = { [[<cmd>Octo reviewer add<cr>]], "Assign a PR reviewer" },
					R = { [[<cmd>Octo pr reload<cr>]], "Reload PR" },
				},
				c = {
					name = "+comment",
					a = { [[<cmd>Octo comment add<cr>]], "Add a review comment" },
					d = { [[<cmd>Octo comment delete<cr>]], "Delete a review comment" },
					r = { [[<cmd>Octo thread resolve<cr>]], "Resolve thread" },
					u = { [[<cmd>Octo thread unresolve<cr>]], "Unresolve thread" },
				},
				l = {
					name = "+label",
					a = { [[<cmd>Octo label add<cr>]], "Add a label" },
					r = { [[<cmd>Octo label remove<cr>]], "Remove a review comment" },
					c = { [[<cmd>Octo label create<cr>]], "Create a label" },
				},
				a = {
					name = "+assignees",
					a = { [[<cmd>Octo assignees add<cr>]], "Assign a user" },
					r = { [[<cmd>Octo assignees remove<cr>]], "Unassign a user" },
				},
				r = {
					name = "+reaction",
					e = { [[<cmd>Octo reaction eyes<cr>]], "Add 👀 reaction" },
					l = { [[<cmd>Octo reaction laugh<cr>]], "Add 😄 reaction" },
					c = { [[<cmd>Octo reaction confused<cr>]], "Add 😕 reaction" },
					r = { [[<cmd>Octo reaction rocket<cr>]], "Add 🚀 reaction" },
					h = { [[<cmd>Octo reaction heart<cr>]], "Add ❤️ reaction" },
					t = { [[<cmd>Octo reaction tada<cr>]], "Add 🎉 reaction" },
				},
			},
			c = {
				name = "+code",
				e = { "<cmd>NnnExplorer %:p:h<cr>", "Explore" },
				E = { "<cmd>NnnExplorer<cr>", "Explore (from root)" },
				p = { "<cmd>NnnPicker %:p:h<cr>", "Picker" },
				P = { "<cmd>NnnPicker<cr>", "Picker (from root)" },
				r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Variable" },
				i = { "<cmd>lua vim.lsp.buf.hover()()<cr>", "Info (hover)" },
				d = { "<cmd>lua vim.diagnostics.open_float()<cr>", "Open Diagnostic" },
				D = { [[<cmd>Telescope lsp_document_diagnostics<cr>]], "Document Diagnostics" },
				w = { [[<cmd>Telescope lsp_workspace_diagnostics<cr>]], "Workspace Diagnostics" },
				c = { "<cmd>CodeActionMenu<cr>", "Code Actions" },
			},
			b = {
				name = "+buffers",
				b = { [[<cmd>Telescope buffers<cr>]], "Switch Buffer" },
				d = { [[<cmd>BufDel<cr>]], "Delete Buffer" },
				k = { [[<cmd>BufDel!<cr>]], "Kill Buffer" },
			},
			e = {
				name = "+editor",
				m = { [[<cmd>Telescope marks<cr>]], "Marks" },
				h = { [[<cmd>Telescope help_tags<cr>]], "Help Tag" },
				[";"] = { [[<cmd>Telescope commands<cr>]], "Commands" },
				c = { [[<cmd>Telescope command_history<cr>]], "Previous Commands" },
				k = { [[<cmd>Telescope keymaps<cr>]], "Keymap" },
				q = { [[<cmd>Telescope quickfix<cr>]], "QuickFix" },
				o = { [[<cmd>Telescope quickfix<cr>]], "Vim Options" },
				v = { "<cmd>VsnipOpenEdit<cr>", "VSnip" },
				w = { "<cmd>WinShift<cr>", "Move Window" },
				s = {
					name = "+sudo",
					r = { "<cmd>SudaRead<cr>", "Read file with sudo" },
					w = { "<cmd>SudaWrite<cr>", "Write file with sudo" },
				},
				p = {
					name = "+packer",
					p = { "<cmd>PackerSync<cr>", "Sync Plugins" },
					c = { "<cmd>PackerCompile<cr>", "Compile Plugins" },
				},
				l = {
					name = "+lsp",
					f = { [[<cmd>LspInfo<cr>]], "Info" },
					i = { [[<cmd>LspInstallInfo<cr>]], "Install" },
				},
			},
			g = {
				name = "+git",
				c = { [[<cmd>Telescope git_bcommits<cr>]], "Git Commits" },
				s = { [[<cmd>Telescope git_status<cr>]], "Git Status" },
				t = { [[<cmd>Telescope git_stash<cr>]], "Git Stashes" },
				g = { [[<cmd>LazyGit<cr>]], "LazyGit" },
				b = { [[<cmd>GitMessenger<cr>]], "Blame" },
				l = {
					function()
						gl.get_buf_range_url("n", {
							action_callback = gla.open_in_browser,
						})
					end,
					"Web Link",
					silent = true,
				},
				L = {
					function()
						gl.get_buf_range_url("v", {
							action_callback = gla.open_in_browser,
						})
					end,
					"Web Link",
					mode = "v",
				},
			},
			t = {
				name = "+test",
				t = { "<cmd>TestNearest<cr>", "Test Nearest" },
				f = { "<cmd>TestFile<cr>", "Test File" },
				a = { "<cmd>TestSuite<cr>", "Test Suite" },
				[";"] = { "<cmd>TestLast<cr>", "Rerun Last Test" },
				["."] = { "<cmd>TestVisit<cr>", "Visit Test" },
			},
			x = {
				name = "+trouble",
				x = { "<cmd>LspTroubleToggle<cr>", "Toggle Trouble" },
				w = { "<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>", "Toggle Workspace Diagnostics" },
				d = { "<cmd>LspTroubleToggle lsp_document_diagnostics<cr>", "Toggle Document Diagnostics" },
				r = { "<cmd>LspTroubleToggle lsp_references<cr>", "Toggle References" },
				q = { "<cmd>LspTroubleToggle quickfix<cr>", "Toggle QuickFix" },
				l = { "<cmd>LspTroubleToggle loclist<cr>", "Toggle Location List" },
				t = { "<cmd>TodoTrouble<cr>", "Toggle TODOs" },
			},
			q = {
				name = "+quit",
				q = { "<cmd>:qa<cr>", "Quit" },
				c = { "<cmd>:q!<cr>", "Close" },
				k = { "<cmd>:qa!<cr>", "Quit without saving" },
				s = { "<cmd>:wa | qa!<cr>", "Quit and save" },
			},
		},
	})
end

function P.install(use)
	if P.installed then
		return
	end

	require("mb.git").install(use)
	require("mb.core").install(use)

	use({ "folke/which-key.nvim", config = P.wk_config })

	P.installed = true
end

return P
