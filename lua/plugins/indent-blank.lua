-- 高亮缩进插件配置

local highlight = {
    "CursorColumn",
    "Whitespace",
}
-- require("ibl").setup {
-- }

return {                                           -- 缩进高亮
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config

    event = "VeryLazy",
    opts = {},
    enabled = true,
}
-- require("indentmini").setup()

-- There is no default value.
-- vim.cmd.highlight('IndentLine guifg=#123456')
-- Current indent line highlight
-- vim.cmd.highlight('IndentLineCurrent guifg=#ffc777')

