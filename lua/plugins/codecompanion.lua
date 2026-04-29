return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		interactions = {
			cli = {
				agent = "claude_code",
				agents = {
					claude_code = {
						cmd = "claude",
						args = {},
						description = "Claude Code CLI",
						provider = "terminal",
					},
				},
				opts = {
					auto_insert = false,
					reload = true,
				},
			},
		},
		display = {
			chat = {
				window = {
					layout = "vertical",
					position = "right",
					width = 0.25,
				},
			},
			cli = {
				window = {
					layout = "vertical",
					position = "right",
					width = 0.25,
				},
			},
		},
	},
}
