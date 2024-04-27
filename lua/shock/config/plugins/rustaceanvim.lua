--
-- rustaceanvim.lua
--
-- Special config for Rust
--

local codelldb = require("mason-registry").get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

vim.g.rustaceanvim = {
	tools = {
		float_win_config = {
			auto_focus = true,
		},
	},
	dap = {
		adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
}
