--
-- dap.lua
--
-- Debug Adapter Protocol configuration
--

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"igorlfs/nvim-dap-view",
			opts = {
				windows = {
					terminal = {
						powition = "right",
					},
				},
			},
			keys = {
				{
					"<leader>dt",
					"<cmd>DapViewToggle<cr>",
					desc = "[T]oggle DAP View",
				},
			},
		},
	},
	config = function()
		local dap = require("dap")

		-- C/C++
		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb",
		}

		dap.configurations.c = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- Configure Keymaps
		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "[D]AP [C]ontinue" })
		vim.keymap.set("n", "<leader>dw", "<cmd>DapViewWatch<cr>", { desc = "[D]AP [W]atch" })
		vim.keymap.set("n", "<F9>", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
		vim.keymap.set("n", "<F8>", "<cmd>DapStepInto<cr>", { desc = "Step Into" })
		vim.keymap.set("n", "<F7>", "<cmd>DapStepOut<cr>", { desc = "Step Out" })
	end,
}
