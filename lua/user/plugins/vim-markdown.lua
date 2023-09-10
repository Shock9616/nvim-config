--
-- vim-markdown.lua
-- 
-- Markdown support
--

return {
    "preservim/vim-markdown",
    dependencies = {
        "godlygeek/tabular",
    },
    config = function ()
        vim.g.vim_markdown_folding_level = 6
    end
}
