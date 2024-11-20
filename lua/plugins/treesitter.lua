-- treesitter插件配置文件
-- 语法高亮

return {
    "nvim-treesitter/nvim-treesitter",          -- 语法高亮
    opts = {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "lua", "vim", "cpp", "python", "json", "vimdoc" },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
        highlight = {
            enable = true,
            -- disable = "help",
        },
        indent = { enable = true },
        auto_install = false,
        -- 不同括号颜色区分
        rainbpw = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        }
    },
    enabled = true;
}

