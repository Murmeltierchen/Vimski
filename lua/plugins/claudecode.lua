return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = true,
	opts = {
		terminal = {
			split_width_percentage = 0.30,
		},
	},
	keys = {
		{ "<C-,>", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<C-a>", "<cmd>ClaudeCodeAdd %<cr>", mode = "n", desc = "Add current buffer" },
		{ "<C-a>", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<C-a>",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},
	},
}
