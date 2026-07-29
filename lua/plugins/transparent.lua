return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").setup({
			extra_groups = {
				"FloatBorder",
				"FloatTitle",
				"FoldColumn",
				"Folded",
				"NormalFloat",
				"TabLine",
				"TabLineFill",
				"VertSplit",
				"WinSeparator",

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
			exclude_groups = {
				"CursorLine",
			},
		})
	end,
}
