--
-- smear-cursor.lua
--
-- Animated cursor for improved visual tracking
--

return {
    "sphamba/smear-cursor.nvim",
    opts = {
        transparent_bg_fallback_color = "#24273a",
        stiffness = 0.8,
        trailing_stiffness = 0.5,
        distance_stop_animating = 0.5,
        hide_target_hack = false,
        smear_insert_mode = false,
    },
}
