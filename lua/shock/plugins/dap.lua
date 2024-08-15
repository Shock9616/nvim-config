--
-- dap.lua
--
-- DAP (Debug Adapter Protocol) config
--

return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	event = "VeryLazy",
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		---------- Adapters ----------

		dap.adapters.codelldb = {
			type = "server",
			port = "1234",
			executable = {
				command = table.concat({
					vim.fn.stdpath("data"),
					"/mason/packages/codelldb/extension/adapter/codelldb",
				}),
				args = { "--port", "1234" },
			},
		}

		---------- Configurations ----------

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
	end,
	keys = {
		{
			"<leader>dt",
			function()
				require("dapui").toggle()
			end,
			desc = "[T]oggle UI",
		},
		{
			"<leader>db",
			"<cmd>DapToggleBreakpoint<cr>",
			desc = "Toggle [B]reakpoint",
		},
		{
			"<leader>dx",
			"<cmd>DapTerminate<cr>",
			desc = "Terminate Debugger",
		},
		{
			"<F7>",
			"<cmd>DapStepOut",
			desc = "Step Out",
		},
		{
			"<F8>",
			"<cmd>DapStepInto",
			desc = "Step Into",
		},
		{
			"<F9>",
			"<cmd>DapStepOver<cr>",
			desc = "Step Over",
		},
		{
			"<leader>dr",
			function()
				require("dapui").open({ reset = true })
			end,
			desc = "[R]eset Windows",
		},
	},
}
