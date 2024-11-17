-- 默认不自动开启
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    'nvim-tree/nvim-tree.lua',                  -- 文件树
    dependencies = { 'nvim-tree/nvim-web-devicons' },              -- 文件树图标
    keys = {
        { "<leader>tr", mode = {"n"}, "<cmd>NvimTreeToggle<CR>", desc = "nvim tree" },
    },
    opts = {},
    enabled = "true",
}
