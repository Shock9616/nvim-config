--
-- fidget.lua
--
-- Config for better notifications
--

require("fidget").setup({
    progress = {
        suppress_on_insert = true,
        display = {
            overrides = {
                pylsp = {
                    update_hook = function(item)
                        if
                            item.nidden == nil
                            and (string.match(item.annote, "lint: ") or string.match(item.annote, "format: "))
                        then
                            item.hidden = true
                        end
                    end,
                },
            },
        },
    },
    notification = {
        window = {
            winblend = 0,
        },
    },
})
