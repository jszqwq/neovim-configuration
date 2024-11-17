-- 编辑树

vim.g.undotree_DiffCommand = "FC"

return {
    'mbbill/undotree',
    keys = {
        { "<leader>ud", mode = {"n"}, "<cmd>UndotreeToggle<CR>" },
        -- { "<leader>tr", mode = {"n"}, "<cmd>NvimTreeToggle<CR>", desc = "nvim tree" },
    },
    enabled = true,
}
