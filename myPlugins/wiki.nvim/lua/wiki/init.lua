local wiki = {}

local turn_path_to_win = function (path)
    local win_path = ""
    -- print(win_path .. "C:\\Users\\geek")
    for i = 1, #path do
        local p = path:sub(i, i)
        if p == '~' then
            win_path = win_path .. "C:\\Users\\geek"
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

local Create_file = function ()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor ()

    if not node then
        return
    end

    -- 如果光标的位置属于连接
    if node:type() == "link_text" or node:type() == "link_destination" then
        local line = vim.api.nvim_get_current_line()
        local pattern = "[^.]+([^)]+)"
        -- print(line)
        local path = string.match(line, pattern)
        if wiki.isWin == true then
            path = turn_path_to_win(path)
        end
        -- vim.notify(path)

        vim.cmd("<cmd>tabe " .. path)
    elseif node:type() == "inline" then
        local s_l, s_r = vim.fn.getpos('v')[2], vim.fn.getpos('v')[3]
        local e_l, e_r = vim.fn.getpos('.')[2], vim.fn.getpos('.')[3]
        local file_name = vim.fn.getline(s_l, e_l)
        file_name[1] = string.sub(file_name[1], s_r)
        if s_l == e_l then
            file_name[#file_name] = string.sub(file_name[#file_name], 1, e_r-s_r+1)
        else
            file_name[#file_name] = string.sub(file_name[#file_name], 1, e_r)
        end

        local file_text = table.concat(file_name, "")
        local file_link = string.gsub(file_text, " ", "_") .. ".md"
        file_link = "./" .. file_link
        print(file_link)
        print(file_link)
        local file_link_win = ""
        if wiki.isWin == true then
            file_link_win = file_link_win .. turn_path_to_win(file_link)
        end
        vim.api.nvim_input('c' .. '[' .. file_text .. '](' .. file_link .. ')<esc><cmd>tabe ' .. file_link_win .. '<CR>')
    end
end

local Open_file = function ()

end

local function setup (opt)
    wiki = vim.tbl_extend ("force", {
        path = "~/wiki/",
        isWin = true,
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
