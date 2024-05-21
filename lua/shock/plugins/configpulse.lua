--
-- configpulse.lua
--
-- 0 days since last config edit
--

return {
	"mrquantumcodes/configpulse",
	event = "VeryLazy",
	config = function()
		vim.cmd([[command! ConfigPulse lua require("configpulse").find_time()]])
	end,
}
