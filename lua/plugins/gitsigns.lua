-- gitsigns 配置
-- 显示 git 标志

return {
    "lewis6991/gitsigns.nvim",                  -- 左则git提示
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    },
    enabled = true,
}
