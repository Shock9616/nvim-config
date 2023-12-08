return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<F9>", "<cmd>DapStepOver<cr>", { desc = "Debug Step Over" })
		vim.keymap.set("n", "<F8>", "<cmd>DapStepInto<cr>", { desc = "Debug Step Into" })

		require("dapui").setup()
	end,
}
