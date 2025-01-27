vim.g.mapleader = " "

local keymap = vim.keymap

-- ------------ 插入模式 ------------ 
keymap.set("i", "jj", "<ESC>")
-- keymap.set("i", "jjj", "j<ESC>")

-- ------------ 视觉模式 ------------ 
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ------------ 正常模式 ------------ 
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "!", ":!")

--消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- ------------ 插件 ----------------
-- nvim-tree
-- keymap.set("n", "<leader>tr", ":NvimTreeToggle<CR>")

-- buffer   缓冲栏快捷
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>")
keymap.set("n", "<S-l>", "<cmd>bnext<CR>")

keymap.set("n", "<C-r>", "")

local abc = function ()
    print(2)
end
keymap.set("n", "moo", abc)
-- vim.cmd("call vim:lua.moo.abc()")
-- vim.fn["command DF 1delete"]()

