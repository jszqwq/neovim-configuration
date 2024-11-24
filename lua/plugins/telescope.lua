-- telescope 配置
--
-- 文件检索功能

-- local builtin = require('telescope.builtin')
-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了
--
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 环境里要安装ripgrep
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',  -- 文件检索
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "VeryLazy",
    -- event = "InsertEnter",
    -- cmd = {
    --     "Telescope find_files",
    --     "Telescope live_grep",
    -- },
    keys = {
        {"<leader>ff", mode = {"n"}, "<cmd>Telescope find_files<cr>", desc = "find files"},
        {"<leader>fg", mode = {"n"}, "<cmd>Telescope live_grep<cr>", desc = "live grep"},
    },
    opts = {
        -- actions = require "telescope.actions",
        defaults = {
            mappings = {
                n = {
                    ["o"] = require "telescope.actions".select_default,
                },
            },
        },
    },
    enabled = true,
}

