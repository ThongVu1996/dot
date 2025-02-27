return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			preset = {
				header = [[





        ]],
			},
			enable = true,
			formats = {
				key = function(item)
					return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
				end,
			},
			sections = {
				{ section = "header", indent = 60 },
				{
					{ section = "keys", gap = 1, padding = 3 },
					{ section = "startup", indent = 60, padding = 5 },
				},
				{
					pane = 2,
					section = "terminal",
					cmd = " ~/dotfiles/nvim/.config/nvim/plugin/dynamic_header.sh 'AEKC'",
					height = 5,
					padding = 3,
					indent = -60,
				},
				{
					pane = 2,
					{
						icon = " ",
						title = "Recent Files",
						padding = 1,
					},
					{
						section = "recent_files",
						opts = { limit = 3 },
						indent = 2,
						padding = 1,
					},
					{
						icon = " ",
						title = "Projects",
						padding = 1,
					},
					{
						section = "projects",
						opts = { limit = 3 },
						indent = 2,
						padding = 1,
					},
				},
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		rename = { enabled = true },
		notifier = {
			enabled = true,
			style = "fancy",
		},
		notify = { enabled = true },
		dim = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		explorer = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = { layout = { position = "right" } },
				},
			},
			formatters = {
				file = {
					filename_first = true, -- Display fileName before the file path
				},
			},
		},
		gitbrowse = {
			what = "branch",
		},
	},

	keys = {
		-- Top Pickers & Explorer
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},

		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>ee",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>nn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		-- Git
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>rf",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		-- Find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- find
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Find Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Find Recent",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep({
					regex = false, -- Force plain text mode
					args = { "-F" }, -- Use fixed-string search
					prompt = "🔍 Plain Text Search: ",
				})
			end,
			desc = "Grep (Fixed-String Mode)",
		},
		-- Use regex
		{
			"<leader>fr",
			function()
				Snacks.picker.grep({
					regex = true, -- Force regex mode
					prompt = "🔍 Regex Search: ",
				})
			end,
			desc = "Grep (Regex Mode)",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		vim.keymap.set("n", "<leader>lr", function()
			Snacks.picker.lsp_references({ layout = { position = "center", width = 0.8, height = 0.6 } })
		end, { desc = "LSP References in Floating Picker" }),
		-- git browser
		vim.keymap.set("n", "<leader>go", function()
			require("snacks").gitbrowse()
		end, { desc = "Open current branch in browser" }),

		-- Copy permalink of the current line or selected range to clipboard
		vim.keymap.set({ "n", "v" }, "<leader>gp", function()
			local start_line, end_line = nil, nil

			-- Get the start and end line if in Visual mode
			if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
				start_line = vim.fn.line("'<") -- Start line of the selected range
				end_line = vim.fn.line("'>") -- End line of the selected range
			else
				start_line = vim.fn.line(".") -- If not in Visual mode, use the current line
				end_line = start_line
			end

			-- Call gitbrowse with line range information
			require("snacks").gitbrowse.open({
				what = "permalink",
				line_start = start_line,
				line_end = end_line,
				open = function(url)
					vim.fn.setreg("+", url) -- Copy URL to clipboard
					vim.notify("Permalink copied to clipboard: Lines " .. start_line .. "-" .. end_line)
				end,
			})
		end, { desc = "Copy permalink of current line or selected range to clipboard" }),

		vim.keymap.set("n", "<leader>gF", function()
			require("snacks").gitbrowse({ what = "branch" })
		end, { desc = "Open current file in browser" }),
	},

	vim.keymap.set("n", "<leader>gc", function()
		require("snacks").gitbrowse({ what = "commit" })
	end, { desc = "Open current commit in browser" }),

	vim.keymap.set("n", "<leader>gr", function()
		require("snacks").gitbrowse({ what = "repo" })
	end, { desc = "Open entire repository in browser" }),
}
