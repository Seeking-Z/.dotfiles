return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").setup()

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local lang = vim.treesitter.language.get_lang(vim.bo.filetype)

				if not lang then
					return
				end

				local ok = pcall(vim.treesitter.start, 0, lang)

				if not ok then
					return
				end
			end,
		})
	end,
}
