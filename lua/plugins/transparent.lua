return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").setup({
			extra_groups = {
				"CursorLine",
				"FloatBorder",
				"FloatTitle",
				"NormalFloat",
				"VertSplit",
				"WinSeparator",

				"NeoTreeCursorLine",
				"NeoTreeEndOfBuffer",
				"NeoTreeIndentMarker",
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"NeoTreeWinSeparator",

				"BlinkCmpDoc",
				"BlinkCmpDocBorder",
				"BlinkCmpMenu",
				"BlinkCmpMenuBorder",
				"BlinkCmpSignatureHelp",
				"BlinkCmpSignatureHelpBorder",
			},
			vim.keymap.set("n", "<C-b>", ":TransparentToggle<CR>", {}),
		})
	end,
}
