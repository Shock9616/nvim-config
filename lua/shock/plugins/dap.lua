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
		require("dapui").setup()

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

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		vim.keymap.set("n", "<leader>dt", function()
			require("dapui").toggle()
		end, { desc = "[T]oggle UI" })
		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>dx", "<cmd>DapTerminate<cr>", { desc = "Terminate Debugger" })
		vim.keymap.set("n", "<F9>", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
		vim.keymap.set("n", "<F8>", "<cmd>DapStepInto<cr>", { desc = "Step Into" })
		vim.keymap.set("n", "<F7>", "<cmd>DapStepOut<cr>", { desc = "Step Out" })
		vim.keymap.set("n", "<leader>dr", function()
			require("dapui").open({ reset = true })
		end, { desc = "[R]eset Windows" })

		-- Xcodebuild Debug Setup
		local xcodebuild = require("xcodebuild.integrations.dap")
		local codelldbPath = os.getenv("HOME") .. "/.bin/codelldb-aarch64-darwin/extension/adapter/codelldb"

		xcodebuild.setup(codelldbPath)
		-- Xcodebuild keybinds
		vim.keymap.set("n", "<leader>xdd", xcodebuild.build_and_debug, { desc = "Build and [D]ebug" })
		vim.keymap.set("n", "<leader>xdr", xcodebuild.debug_without_build, { desc = "[D]ebug Without Building" })
		vim.keymap.set("n", "<leader>xdt", xcodebuild.debug_tests, { desc = "[D]ebug [T]ests" })
		vim.keymap.set("n", "<leader>xdT", xcodebuild.debug_class_tests, { desc = "Debug Class [T]ests" })
		vim.keymap.set("n", "<leader>xb", xcodebuild.toggle_breakpoint, { desc = "Toggle [B]reakpoint" })
		vim.keymap.set(
			"n",
			"<leader>xB",
			xcodebuild.toggle_message_breakpoint,
			{ desc = "Toggle Message [B]reakpoint" }
		)
		vim.keymap.set("n", "<leader>xdx", xcodebuild.terminate_session, { desc = "Terminate [D]ebugger" })
	end,
}
