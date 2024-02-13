--
-- visual.lua
--
-- Visual plugins. What'd you expect?
--

return {
    {
        -- Colour scheme
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000 },
    {
        -- Status bar
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
}
