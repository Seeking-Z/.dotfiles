return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = {
					"stylua",
				},

				c = {
					"clang_format",
				},

				cpp = {
					"clang_format",
				},

				json = {
					"prettier",
				},

				jsonc = {
					"prettier",
				},

				css = {
					"prettier",
				},

				scss = {
					"prettier",
				},

				html = {
					"prettier",
				},

				javascript = {
					"prettier",
				},

				markdown = {
					"prettier",
				},

				yaml = {
					"prettier",
				},
			},

			formatters = {
				prettier = {
					prepend_args = {
						"--trailing-comma",
						"none",
					},
				},
			},

			vim.keymap.set("n", "<leader>F", function()
				conform.format({
					async = true,
					lsp_fallback = true,
				})
			end, {
				desc = "Format current file",
			}),

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
