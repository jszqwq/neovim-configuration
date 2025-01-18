-- 引入插件路径
-- vim.opt.runtimepath:append("D:\\\\Users\\geek\\Desktop\\VSCode\\learning\\nvim_plugins\\study")
-- vim.opt.runtimepath:append("$env:CODEPATH\\learning\\nvim_plugins\\study")
require("core.keymaps")
require("plugins.plugins-setup")
require("core.options")

-- vim.opt.runtimepath:append("$CODEPATH/learning/nvim_plugins/languageRunning")
-- require("languageRunning").setup({})

local pluginsPath = vim.fn.stdpath("data") .. "/../nvim/myPlugins/"
vim.opt.runtimepath:append(pluginsPath .. "wiki.nvim")
require("wiki").setup({
    isWin = true,
    userName = "geek",
})

