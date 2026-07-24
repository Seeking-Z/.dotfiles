return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
				},

				bind_to_cwd = true,

				follow_current_file = {
					enabled = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
			desc = "Toggle file explorer",
		})
	end,
}
