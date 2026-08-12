return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"delve",
				"eslint_d",
				"gofumpt",
				"goimports-reviser",
				"golangci-lint",
				"prettierd",
				"stylua",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"gopls",
				"html",
				"lua_ls",
				"ts_ls",
				"intelephense",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local ok, intelephenseKey = pcall(require, "secrets.intelephense-licence")

			vim.lsp.config("gopls", { capabilities = capabilities })
			vim.lsp.config("html", { capabilities = capabilities })
			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.config("ts_ls", { capabilities = capabilities })
			vim.lsp.config("intelephense", {
				capabilities = capabilities,
				root_dir = vim.fn.getcwd(),

				init_options = {
					licenceKey = ok and intelephenseKey or nil,
				},

				settings = {
					intelephense = {
						stubs = {
							"apache",
							"bcmath",
							"bz2",
							"calendar",
							"com_dotnet",
							"Core",
							"ctype",
							"curl",
							"date",
							"dba",
							"dom",
							"enchant",
							"exif",
							"FFI",
							"fileinfo",
							"filter",
							"fpm",
							"ftp",
							"gd",
							"gettext",
							"gmp",
							"hash",
							"iconv",
							"imap",
							"intl",
							"json",
							"ldap",
							"libxml",
							"mbstring",
							"meta",
							"mysqli",
							"oci8",
							"odbc",
							"openssl",
							"pcntl",
							"pcre",
							"PDO",
							"pdo_ibm",
							"pdo_mysql",
							"pdo_pgsql",
							"pdo_sqlite",
							"pgsql",
							"Phar",
							"posix",
							"pspell",
							"readline",
							"redis",
							"Reflection",
							"session",
							"shmop",
							"SimpleXML",
							"snmp",
							"soap",
							"sockets",
							"sodium",
							"SPL",
							"sqlite3",
							"standard",
							"superglobals",
							"sysvmsg",
							"sysvsem",
							"sysvshm",
							"tidy",
							"tokenizer",
							"xml",
							"xmlreader",
							"xmlrpc",
							"xmlwriter",
							"xsl",
							"Zend OPcache",
							"zip",
							"zlib",
						},
					},
				},
			})

			vim.lsp.enable("gopls")
			vim.lsp.enable("html")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("intelephense")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})

			vim.keymap.set("n", "<leader>pd", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
			vim.keymap.set("n", "<leader>pt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
			vim.keymap.set("n", "<leader>pi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
			vim.keymap.set("n", "<leader>pr", vim.lsp.buf.rename, { desc = "Rename (Intelephense Premium)" })
			vim.keymap.set({ "n", "v" }, "<leader>pa", vim.lsp.buf.code_action, { desc = "Code Actions" })

			vim.api.nvim_set_hl(0, "LspInlayHint", {
				fg = "#5e6c79",
				bg = "NONE",
				italic = true,
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
						vim.keymap.set("n", "<leader>ph", function()
							local current_state = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
							vim.lsp.inlay_hint.enable(not current_state, { bufnr = 0 })
						end, { buffer = event.buf })
					end
				end,
			})
			vim.keymap.set("n", "<leader>ph", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end)

			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.keymap.set("n", "<CR>", "za")
		end,
	},
}
