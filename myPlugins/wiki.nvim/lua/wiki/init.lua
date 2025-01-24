local check_line = require("wiki.check_line")
local wiki = {}

local turn_path_to_win = function (path)
    local win_path = ""
    -- print(win_path .. "C:\\Users\\geek")
    for i = 1, #path do
        local p = path:sub(i, i)
        if p == '~' then
            win_path = win_path .. "C:\\Users\\" .. wiki.userName
        elseif p == '/' then
            win_path = win_path .. "\\"
        elseif p ==  '.' and i == 1 then
            win_path = win_path ..  wiki.path
        else
            win_path = win_path ..  p
        end
    end
    return win_path
end

-- 打开 wiki 插件
local Open_Wiki = function ()
    local path = wiki.path

    if vim.fn.filereadable ( vim.fn.expand(path .. "index.md" ) ) == 0 then      -- 如果文件不存在
        vim.cmd("silent !mkdir " .. path)
        vim.cmd("silent !type nul > " .. path .. "index.md")
    end

    vim.cmd("e " .. path .. "index.md")
end

-- 打开文件, 如果文件才存在则新建并补全当前行
local Create_file = function ()
    local line = vim.api.nvim_get_current_line()
    local file_name = check_line.check_file_name(line)
    local file_path = check_line.check_file_path(line)

    -- 如果是纯文本行, 则补充完整当前行
    if file_name == nil or file_path == nil then
        file_name = line
        file_path = "./" .. file_name .. ".md"
        vim.api.nvim_input('cc' .. '[' .. file_name .. '](' .. file_path .. ')<esc>')
    end

    if string.len(file_name) == 0 or string.len(file_path) == 0 then
        vim.notify("the file name is illegal")
        return
    end

    if wiki.isWin == true then
        vim.api.nvim_input(":tabe " .. turn_path_to_win(file_path) .. "<CR>")
    else
        vim.api.nvim_input(":tabe " .. file_path .. "<CR>")
    end
end

local Open_file = function ()
end

local function setup (opt)
    wiki = vim.tbl_extend ("force", {
        path = "~/wiki/",
        isWin = true,
        userName = "jszqwq",
        -- path = "C:\\Users\\geek\\wiki\\",
        key_wiki_open = '<leader>ww',
        key_wiki_file = '<leader>wo',
    }, opt or {})

    -- wiki_open()
    if wiki.isWin == true then
        wiki.path = turn_path_to_win(wiki.path)
    end
    vim.keymap.set("n", wiki.key_wiki_open, Open_Wiki)
    vim.keymap.set("n", wiki.key_wiki_file, Open_file)
    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
        pattern = "*.md",
        callback = function ()
            vim.keymap.set ({"n", "v"}, wiki.key_wiki_file, Create_file)
        end
    })
end

return {
    setup = setup,
}
