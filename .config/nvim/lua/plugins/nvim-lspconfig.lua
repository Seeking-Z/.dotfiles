return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- LSP启动时设置快捷键
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local map = vim.keymap.set

				map("n", "gd", vim.lsp.buf.definition, {
					buffer = event.buf,
					desc = "Go to definition",
				})

				map("n", "gD", vim.lsp.buf.declaration, {
					buffer = event.buf,
					desc = "Go to declaration",
				})

				map("n", "gr", vim.lsp.buf.references, {
					buffer = event.buf,
					desc = "Show references",
				})

				map("n", "K", vim.lsp.buf.hover, {
					buffer = event.buf,
					desc = "Show hover documentation",
				})

				map("n", "<leader>lr", vim.lsp.buf.rename, {
					buffer = event.buf,
					desc = "Rename symbol",
				})

				map("n", "<leader>la", vim.lsp.buf.code_action, {
					buffer = event.buf,
					desc = "Code action",
				})

				map("n", "<leader>ld", vim.diagnostic.open_float, {
					buffer = event.buf,
					desc = "Show diagnostic",
				})
			end,
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,

			settings = {
				Lua = {
					diagnostics = {
						globals = {
							"vim",
							"hl",
						},
					},

					telemetry = {
						enable = false,
					},
				},
			},
		})

		vim.lsp.config("jsonls", {
			capabilities = capabilities,
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
		})

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--completion-style=detailed",
			},
		})

		vim.lsp.config("bashls", {
			capabilities = capabilities,
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("jsonls")
		vim.lsp.enable("cssls")
		vim.lsp.enable("clangd")
		vim.lsp.enable("bashls")
	end,
}
