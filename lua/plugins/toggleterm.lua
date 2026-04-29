return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = nil,
			direction = "float",
			float_opts = {
				border = "curved",
			},
			hide_numbers = false,
            shade_terminals = false,
			start_in_insert = false,
			auto_scroll = false,
		})
	end,
}
