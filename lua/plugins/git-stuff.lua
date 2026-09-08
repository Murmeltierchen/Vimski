return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>h", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>ha", ":Gitsigns setloclist target=all<CR>", {})
			vim.keymap.set("n", "<leader>b", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
		opts = {
			highlights = {
				line_insert = "#1F4068",
				line_delete = "#590505",
			},
			diff = {
				compute_moves = false,
			},
			explorer = {
				icons = {
					folder_closed = "",
					folder_open = "",
				},
				view_mode = "tree",
				flatten_dirs = false,
				file_filter = {
					ignore = { ".git/**", "vendor/", "*.lock" },
				},
			},
			keymaps = {
				view = {
					quit = "<Esc>",
				},
			},
		},
	},
}
