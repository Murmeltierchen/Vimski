return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					{
						name = "Cyberdream",
						colorscheme = "cyberdream",
					},
					{
						name = "GitHub Dark (Default)",
						colorscheme = "github_dark_default",
					},
					{
						name = "GitHub Dark (Colorbild)",
						colorscheme = "github_dark_colorblind",
					},
					{
						name = "OneDark (Deep)",
						colorscheme = "onedark",
					},
					{
						name = "Visual Studio Code Dark",
						colorscheme = "vscode",
					},
				},
				livePreview = true,
			})
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				italic_comments = true,
			})
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					styles = {
						comments = "italic",
					},
				},
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "deep",
			})
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		lazy = false,
		priority = 1000,
		config = function()
			require("vscode").setup({
				italic_comments = true,
			})
		end,
	},
}
