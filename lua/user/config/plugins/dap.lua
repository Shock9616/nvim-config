--
-- dap.lua
--
-- Config for debuggers
--

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

-- Xcodebuild settings
local xcodebuild = require("xcodebuild.integrations.dap")
local codelldbPath = os.getenv("HOME") .. ".vscode/extensions/vadimcn.vscode-lldb-1.10.0/lldb/bin/lldb"

xcodebuild.setup(codelldbPath)

require("dapui").setup()
