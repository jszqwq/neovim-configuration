-- autopairs 配置
-- 自动补全括号

return {
    "windwp/nvim-autopairs",                    -- 自动补全括号
    event = "InsertEnter",
    config = function ()
        local npairs_ok, npairs = pcall(require, "nvim-autopairs")
        if not npairs_ok then
          return
        end

        npairs.setup {
            check_ts = true,
            ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
            },
            enable_check_bracket_line = false,
            fast_wrap = {
            map = '<M-e>',
            chars = { '{', '[', '(', '"', "'" },
            pattern = [=[[%'%"%)%>%]%)%}%,]]=],
            end_key = '$',
            keys = 'qwertyuiopzxcvbnmasdfghjkl',
            check_comma = true,
            highlight = 'Search',
            highlight_grey='Comment'
          },
        }

        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        npairs.add_rules({
            Rule("(", ")")
                :with_pair(cond.not_inside_quote()),
        })

        -- 配置这个使得自动补全会把括号带上

        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
          return
        end
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end,
    enabled = true
}


