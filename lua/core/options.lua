-- neovim 的基本设置文件

local opt = vim.opt
local tabsize = 4

-- 行号
opt.number = true
opt.relativenumber = true

-- 缩进
opt.tabstop = tabsize
opt.shiftwidth = tabsize
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme tokyonight-storm]]
-- vim.cmd[[colorscheme vim]]
-- require("notify").setup({
--     background_colour = "#a0a0A0",
-- })

-- 显示回车符
-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

