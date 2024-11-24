-- 编辑树

vim.g.undotree_DiffCommand = "FC"

return {
    'mbbill/undotree',
    keys = {
        { "<leader>ud", mode = {"n"}, "<cmd>UndotreeToggle<CR>", desc = "undoTree" },
    },
    enabled = true,
}
