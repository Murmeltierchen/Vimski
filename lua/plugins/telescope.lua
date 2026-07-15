return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local open_with_trouble = require("trouble.sources.telescope").open

			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<c-t>"] = open_with_trouble },
						n = { ["<c-t>"] = open_with_trouble },
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<C-g>", function()
				builtin.live_grep({
					additional_args = function()
						return { "--hidden", "--glob=!.git/*" }
					end,
				})
			end, {})
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
			vim.keymap.set("n", "<C-Space>", builtin.oldfiles, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
