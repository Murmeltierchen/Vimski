return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
            ensure_installed = {
                "delve",
                "eslint_d",
                "gofumpt",
                "goimports-reviser",
                "golangci-lint",
                "gopls",
                "html",
                "lua_ls",
                "prettierd",
                "rust_analyzer",
                "ts_ls",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.config("html", {
                capabilities = capabilities,
            })
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("html")
            vim.lsp.enable("ts_ls")

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
        end,
    },
}
