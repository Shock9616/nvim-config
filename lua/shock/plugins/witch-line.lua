--
-- witch-line.lua
--
-- Custom statusline
--

return {
    "sontungexpt/witch-line",
    -- enabled = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "catppuccin/nvim",
    },
    lazy = false,
    config = function()
        local colors = require("catppuccin.palettes").get_palette("macchiato")
        local color_map = {
            n = colors.blue,
            i = colors.green,
            v = colors.mauve,
            V = colors.peach,
            ["\22"] = colors.pink,
            c = colors.red,
            R = colors.teal,
            t = colors.yellow
        }

        require("witch-line").setup({
            statusline = {
                global = {
                    -- Mode
                    {
                        id = "short_mode",
                        events = { "UIEnter", "ModeChanged" },
                        update = function()
                            local modes = {
                                n = "N",
                                i = "I",
                                v = "V",
                                V = "L",
                                ["\22"] = "B",
                                c = "C",
                                R = "R",
                                t = "T"
                            }
                            local mode = vim.fn.mode()
                            return modes[mode]
                        end,
                        padding = { left = 1, right = 0 },
                        style = function()
                            local mode = vim.fn.mode()
                            return { fg = colors.mantle, bg = color_map[mode] }
                        end,
                        right = "",
                        right_style = function()
                            local mode = vim.fn.mode()
                            return { fg = color_map[mode], bg = colors.surface2 }
                        end
                    },

                    {
                        id = "mode_separator",
                        events = { "UIEnter" },
                        update = "",
                        padding = 0,
                        style = { fg = colors.surface2, bg = colors.surface0 }
                    },

                    -- File
                    {
                        [0] = "file.icon",
                        padding = { left = 2, right = 1 },
                        style = function(self, sid)
                            local ctx = require("witch-line.core.manager.hook").use_context(self, sid)
                            return { fg = ctx.color, bg = colors.surface0 }
                        end
                    },
                    {
                        [0] = "file.name",
                        style = { fg = colors.text, bg = colors.surface0 },
                        -- padding = { left = 1, right = 0 }
                    },
                    {
                        [0] = "file.modifier",
                        style = { fg = colors.text, bg = colors.surface0 },
                        padding = { left = 0, right = 1 }
                    },
                    {
                        id = "file_separator",
                        events = { "UIEnter" },
                        update = "",
                        padding = 0,
                        style = { fg = colors.surface0, bg = colors.base }
                    },

                    -- Git
                    {
                        [0] = "git.branch",
                        style = { fg = colors.subtext0, bg = colors.base },
                        static = {
                            icon = ""
                        },
                    },
                    {
                        [0] = "git.diff.added",
                        static = { icon = "󰐙 " },
                        style = { fg = colors.subtext0, bg = colors.base }
                    },
                    {
                        [0] = "git.diff.removed",
                        static = { icon = "󰍷 " },
                        style = { fg = colors.subtext0, bg = colors.base }
                    },
                    {
                        [0] = "git.diff.modified",
                        static = { icon = " " },
                        style = { fg = colors.subtext0, bg = colors.base }
                    },

                    "%=",

                    -- Diagnostics
                    "diagnostic.error",
                    "diagnostic.warn",
                    "diagnostic.info",
                    "diagnostic.hint",

                    -- LSP
                    {
                        id = "lsp_icon",
                        events = { "UIEnter" },
                        update = "",
                        padding = { left = 0, right = 2 },
                        style = { fg = colors.text, bg = colors.surface0 },
                        left = "",
                        left_style = { fg = colors.surface0, bg = colors.base }
                    },
                    {
                        id = "lsp_clients",
                        events = { "LspAttach", "LspDetach", "BufWritePost" },
                        style = { fg = colors.text, bg = colors.surface0 },
                        padding = { left = 0, right = 1 },
                        update = function()
                            local clients = vim.lsp.get_clients()
                            if next(clients) == nil then
                                return ""
                            end

                            local c = {}
                            for _, client in pairs(clients) do
                                table.insert(c, client.name)
                            end
                            return table.concat(c, " | ")
                        end
                    },
                    {
                        id = "right_end",
                        events = { "UIEnter", "ModeChanged" },
                        update = "█",
                        padding = 0,
                        style = function()
                            local mode = vim.fn.mode()
                            return { fg = color_map[mode], bg = colors.surface2 }
                        end,
                        left = "",
                        left_style = { fg = colors.surface2, bg = colors.surface0 }
                    }
                }
            }
        })
    end
}
