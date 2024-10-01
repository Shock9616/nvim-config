--
-- treesitter.lua
--
-- Treesitter config
--

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"python",
				"rust",
				"swift",
				"c",
				"cpp",
				"java",
				"javascript",
				"html",
				"css",
				"bash",
				"regex",
				"markdown",
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
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- Assignments
						["a="] = { query = "@assignment.outer", desc = "Select the outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select the the inner part of an assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select the left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select the right hand side of an assignment" },

						-- Arguments
						["aa"] = { query = "@parameter.outer", desc = "Select the outer part of a parameter/argument" },
						["ia"] = { query = "@parameter.outer", desc = "Select the inner part of a parameter/argument" },

						-- Conditionals
						["ai"] = { query = "@conditional.outer", desc = "Select the outer part of a conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Select the inner part of a conditional" },

						-- Loops
						["al"] = { query = "@loop.outer", desc = "Select the outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select the inner part of a loop" },

						-- Function/method definitions
						["am"] = {
							query = "@function.outer",
							desc = "Select the outer part of a function/method definition",
						},
						["im"] = {
							query = "@function.inner",
							desc = "Select the inner part of a function/method definition",
						},
						["af"] = {
							query = "@call.outer",
							desc = "Select the outer part of a function call",
						},
						["if"] = {
							query = "@call.inner",
							desc = "Select the inner part of a function call",
						},

						-- Class
						["ac"] = { query = "@class.outer", desc = "Select the outer part of a class" },
						["ic"] = { query = "@class.inner", desc = "Select the inner part of a class" },
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = { query = "@call.outer", desc = "Next function call start" },
						["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer", desc = "Next function call end" },
						["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer", desc = "Next function call start" },
						["[m"] = { query = "@function.outer", desc = "Next method/function def start" },
						["[c"] = { query = "@class.outer", desc = "Next class start" },
						["[i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["[l"] = { query = "@loop.outer", desc = "Next loop start" },
						["[s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer", desc = "Next function call end" },
						["[M"] = { query = "@function.outer", desc = "Next method/function def end" },
						["[C"] = { query = "@class.outer", desc = "Next class end" },
						["[I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["[L"] = { query = "@loop.outer", desc = "Next loop end" },
					},
				},
			},
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr)
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr)
	end,
}
