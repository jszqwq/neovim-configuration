
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        jump = {
            remote_op = {                   -- ycd 的配合
                restore = true,
                motion = true,
            },
        },
    },
    -- stylua: ignore
    keys = {
        { "/", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },                         -- flash 光标跳转插件
    enabled = true,
}
