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

-- Xcodebuild Debug Setup
local xcodebuild = require("xcodebuild.integrations.dap")
local codelldbPath = os.getenv("HOME") .. "/.bin/codelldb-aarch64-darwin/extension/adapter/codelldb"

xcodebuild.setup(codelldbPath)
-- Xcodebuild keybinds
vim.keymap.set("n", "<leader>xdd", xcodebuild.build_and_debug, { desc = "Build and Debug" })
vim.keymap.set("n", "<leader>xdr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
vim.keymap.set("n", "<leader>xdt", xcodebuild.debug_tests, { desc = "Debug Tests" })
vim.keymap.set("n", "<leader>xdT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
vim.keymap.set("n", "<leader>xb", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>xB", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
vim.keymap.set("n", "<leader>xdx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
