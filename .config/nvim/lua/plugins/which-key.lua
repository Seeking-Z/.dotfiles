return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	config = function()
		local wk = require("which-key")

		wk.setup()

		wk.add({
			{
				"<leader>w",
				desc = "Save file",
			},

			{
				"<leader>q",
				desc = "Quit",
			},

			{
				"<leader>f",
				group = "Find",
			},

			{
				"<leader>l",
				group = "LSP",
			},

			{
				"<leader>p",
				group = "Preview",
			},
		})
	end,
}
