-- neovim keymaps

local map = vim.keymap.set

-- Leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保存
map("n", "<leader>w", "<cmd>w<CR>", {
	desc = "Save file",
})

-- 退出
map("n", "<leader>q", "<cmd>q<CR>", {
	desc = "Quit",
})

-- 清除搜索高亮
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
	desc = "Clear search highlight",
})

-- 窗口移动
map("n", "<C-h>", "<C-w>h", {
	desc = "Move to left window",
})

map("n", "<C-j>", "<C-w>j", {
	desc = "Move to lower window",
})

map("n", "<C-k>", "<C-w>k", {
	desc = "Move to upper window",
})

map("n", "<C-l>", "<C-w>l", {
	desc = "Move to right window",
})
