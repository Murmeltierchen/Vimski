return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
        require("transparent").setup({
            extra_groups = {
                "NormalFloat",
                "FloatBorder",

                "NeoTreeNormal",

                "BlinkCmpMenu",
                "BlinkCmpMenuBorder",
                "BlinkCmpDoc",
                "BlinkCmpDocBorder",
                "BlinkCmpSignatureHelp",
                "BlinkCmpSignatureHelpBorder",
            },
            vim.keymap.set("n", "<C-b>", ":TransparentToggle<CR>", {}),
        })
    end,
}
