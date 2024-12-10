-- 编辑树

vim.g.undotree_DiffCommand = "FC"

-- local withdrawUndo = function ()
--
-- end
-- keymap.set("n", "U", withdrawUndo)

return {
    'mbbill/undotree',
    keys = {
        { "<leader>ud", mode = {"n"}, "<cmd>UndotreeToggle<CR>", desc = "undoTree" },
    },
    enabled = true,
}
