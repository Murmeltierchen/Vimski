return {
    {
        "mrcjkb/rustaceanvim",
        version = "*",
        lazy = false,
        ft = { "rust" },
        config = function()
            local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

            local cfg = require('rustaceanvim.config')

            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ['rust-analyzer'] = {
                            cargo = {
                                allFeatures = true,
                            },
                        },
                    },
                },
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            }
        end
    },
}
