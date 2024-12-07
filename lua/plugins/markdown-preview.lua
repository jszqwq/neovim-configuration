-- md 预览
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
        { "<C-r>", mode = {"n"}, "<cmd>MarkdownPreview<CR>", desc = "MarkdownPreview", ft = "markdown" },
        { "<C-c>", mode = {"n"}, "<cmd>MarkdownPreviewStop<CR>", desc = "MarkdownPreview", ft = "markdown" },
    },
    -- build = "cd app && yarn install",
    build = function ()
        vim.fn[":terminal" .. "cd app"]()
        vim.fn[":terminal" .. "yarn install"]()
        vim.fn["mkdp#util#install()"]()
    end,

    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        -- vim.fn["mkdp#util#install()"]()
    end,
    ft = { "markdown" },
    enabled = true,
}
