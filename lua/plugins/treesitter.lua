-- treesitter插件配置文件
-- 语法高亮

return {
    "nvim-treesitter/nvim-treesitter",          -- 语法高亮
    event = "VeryLazy",
    dependencies = {
        "p00f/nvim-ts-rainbow",
    },
    main = "nvim-treesitter.configs",
    opts = {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "lua", "vim", "cpp", "python", "json", "vimdoc" },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
        highlight = {
            enable = true,
        },
        indent = { enable = true },
        auto_install = true,
        incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<CR>",
              node_incremental = "<CR>",
              node_decremental = "<BS>",
              scope_incremental = "<TAB>"
            },
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
    },
    enabled = true,
}

