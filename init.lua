-- 引入插件路径
-- vim.opt.runtimepath:append("D:\\\\Users\\geek\\Desktop\\VSCode\\nvim_plugins\\study")
-- vim.opt.runtimepath:append("$env:CODEPATH/nvim_plugins/study")
-- vim.opt.runtimepath:append("$CODEPATH/nvim_plugins/study")

require("core.keymaps")
require("plugins.plugins-setup")
-- require("plugins.lualine")
-- require("plugins.nvim-tree")
-- require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
-- require("plugins.comment")
require("plugins.autopairs")
-- require("plugins.bufferline")
-- require("plugins.gitsigns")
-- require("plugins.telescope")
-- require("plugins.noice")
-- require("plugins.endwise")
-- require("plugins.indent-blank")
require("core.options")

-- 个人插件
-- require("study").setup()
-- pkg.setup()

