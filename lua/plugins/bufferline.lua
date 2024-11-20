-- bufferline 配置
-- 显示缓冲分隔符

local keymap = vim.keymap
keymap.set("n", "<leader>c", "<cmd>BufferLinePickClose<cr>")
keymap.set("n", "<leader>g", "<cmd>BufferLinePick<cr>")
keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>")

return {
    "akinsho/bufferline.nvim",                  -- buffer分割线
    opts = {
        options = {
            -- 使用 nvim 内置lsp
            diagnostics = "nvim_lsp",
            -- 左侧让出 nvim-tree 的位置
            offsets = {{
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }},
            indicator = {
                style = 'underline',
                -- color = "#ff0000",
            },
            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end
        },
    },
    enabled = true,
}
