return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("telescope").setup({})

        local builtin =
            require("telescope.builtin")

        local map = vim.keymap.set

        map(
            "n",
            "<leader>ff",
            builtin.find_files,
            {
                desc = "Find files",
            }
        )

        map(
            "n",
            "<leader>fg",
            builtin.live_grep,
            {
                desc = "Search text",
            }
        )

        map(
            "n",
            "<leader>fr",
            builtin.oldfiles,
            {
                desc = "Recent files",
            }
        )
    end,
}
