-- mason.nvim 配置文件
-- LSP 语法提示

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        -- "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
    },
    -- priority = 1000,
    -- event = "VeryLazy",
    -- cmd = "Mason",
    config = function ()
        -- 图标配置
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        -- LSP 配置
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", "clangd"
            }
        })

        -- local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- lua 
        require("lspconfig").lua_ls.setup {
            -- capabilities = capabilities
        }

        -- C++ lsp
        require("lspconfig").clangd.setup {
            -- capabilities = capabilities,
            -- 需要到 "C:\Users\geek\AppData\Local\clangd" 下配置 config.yaml 文件
            cmd = {
                "clangd",
                -- '--query-driver="D:/Users/geek/Desktop/VSCode/MinGW/x86_64-12.2.0-release-posix-seh-rt_v10-rev0_2/mingw64"',
                '-resource-dir="D:/Users/geek/Desktop/VSCode/MinGW/x86_64-12.2.0-release-posix-seh-rt_v10-rev0_2/mingw64"'
            },
            filetypes = { "c", "cpp", "objc", "objcpp" },
        }

        -- Python lsp
        require'lspconfig'.jedi_language_server.setup{
            cmd = {"jedi-language-server"}
        }

        -- cmake
        require'lspconfig'.cmake.setup{
            cmd = { "cmake-language-server" },
            filetypes = {"cmake"},
            init_options = {buildDirectory = "build"},
            -- root_dir = {root_pattern('CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake')},
            single_file_support = true,
        }

        -- Matlab
        -- require'lspconfig'.matlab_ls.setup{
        --     filetypes = {"matlab"}
        -- }

    end,
    enabled = true,
}
