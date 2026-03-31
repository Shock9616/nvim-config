--
-- treesitter.lua
--
-- Treesitter config
--

-- Update treesitter parsers whenever treesitter is updated
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = {
		enable = true,
	},
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"regex",
		"query",
		"python",
		"markdown",
		"latex",
		"c",
	},
	auto_install = true,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-space>",
			node_incremental = "<M-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})

require("nvim-treesitter-textobjects").setup({
	enable = true,
	lookahead = true,
})

-- Set keymaps for textobjects
-- Assignments
vim.keymap.set({ "x", "o" }, "a=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "i=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "l=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.lhs", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "r=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.rhs", "textobjects")
end)

-- Arguments
vim.keymap.set({ "x", "o" }, "aa", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end)

-- Conditionals
vim.keymap.set({ "x", "o" }, "ai", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ii", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
end)

-- Loops
vim.keymap.set({ "x", "o" }, "al", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "il", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end)

-- Function/method definitions
vim.keymap.set({ "x", "o" }, "am", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)

-- Function/method calls
vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
end)

-- Classes
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
