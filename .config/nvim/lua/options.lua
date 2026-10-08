-- neovim options

local opt = vim.opt

-- 行号
opt.number = true
opt.relativenumber = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- 鼠标
opt.mouse = "a"

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 当前行高亮
opt.cursorline = true

-- 启用剪切板
opt.clipboard = "unnamedplus"

-- 撤销文件
opt.undofile = true
