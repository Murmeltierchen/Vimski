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
		"dlyongemallo/diffview.nvim",
		version = "*",
		cmd = {
			"DiffviewOpen",
			"DiffviewToggle",
			"DiffviewFileHistory",
			"DiffviewDiffFiles",
			"DiffviewLog",
		},
	},
}
