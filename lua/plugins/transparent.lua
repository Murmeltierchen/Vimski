return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").setup({
			extra_groups = {
				"CursorLine",
				"FloatBorder",
				"FloatTitle",
				"FoldColumn",
				"Folded",
				"NormalFloat",
				"TabLine",
				"TabLineFill",
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
		})
	end,
}
