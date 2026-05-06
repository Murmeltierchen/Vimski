return {
    {
        "mrcjkb/rustaceanvim",
        version = "*",
        lazy = false,
        ft = { "rust" },
        config = function()
            local mason_registry = require('mason-registry')
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

            local cfg = require('rustaceanvim.config')

            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, bufnr)
                    end,
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
