return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            css = { "prettierd" },
            go = { "goimports", "gofumpt" },
            graphql = { "prettierd" },
            html = { "prettierd" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            less = { "prettierd" },
            lua = { "stylua" },
            markdown = { "prettierd" },
            scss = { "prettierd" },
            svelte = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            vue = { "prettierd" },
            yaml = { "prettierd" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },

    config = function()
        vim.keymap.set("n", "<C-s>", vim.lsp.buf.format, {})
    end
}
