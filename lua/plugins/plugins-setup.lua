-- lazy 插件管理配置

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
--     'folke/tokyonight.nvim',                    -- 主题
    { import = "plugins.tokyonight" },          -- 主题外观
    { import = "plugins.lualine" },             -- 底部状态栏
    { import = "plugins.nvim-tree" },           -- 文件树
    { import = "plugins.navigator"},            -- 跳转分屏
    { import = "plugins.treesitter" },          -- 语法高亮
    { import = "plugins.nvim-ts-rainbow" },     -- 颜色区分括号层级

    { import = "plugins.lsp" },                 -- LSP
    -- {                                           -- LSP语法提示
    --     "williamboman/mason.nvim",
    --     "williamboman/mason-lspconfig.nvim",
    --     "neovim/nvim-lspconfig",
    --     event = "VeryLazy",
    -- },

    -- 自动补全
    { import = "plugins.cmp" },                 -- 自动补全

    { import = "plugins.snippets" },            -- 代码块
    -- "hrsh7th/cmp-path",                         -- 文件路径

    {import = "plugins.Comment"},               -- gc注释
    {import = "plugins.autopairs"},             -- 自动补全括号

    { import = "plugins.bufferline"},           -- 窗口分隔
    { import = "plugins.gitsigns"},             -- git 标志

    { import = "plugins.telescope" },           -- 文件搜索

    { import = "plugins.flash" },               -- 光标跳转
	{ import = "plugins.noice" },               -- 命令行

    -- 'thinca/vim-prettyprint',                   -- 打印文字

    { import = "plugins.indent-blank" },        -- 竖线高亮

    { import = "plugins.undotree" },            -- 编辑树

    { import = "plugins.markdown-preview" },    -- md 预览
}

-- local opts = {} -- 注意要定义这个变量
-- require("lazy").setup(plugins, opts)

require("lazy").setup(plugins)
