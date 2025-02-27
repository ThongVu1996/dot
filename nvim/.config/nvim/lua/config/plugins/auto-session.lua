return {
	"rmagatti/auto-session",
	cmd = { "SessionRestore", "SessionSave" },
	config = function()
		-- Configure sessionoptions before setting up auto-session
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore = false,
			-- List folders don't save in session
			suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		local keymap = vim.keymap
		-- restore last workspace session for current directory
		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
		-- save workspace session for current working directory
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
	end,
}
