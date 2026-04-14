--
-- commands.lua
--
-- Custom user commands
--

-- vim.plug commands
vim.api.nvim_create_user_command("PackUpdate", function(opts)
	if opts.args == "" then
		vim.pack.update()
	else
		local packages = vim.split(opts.args, " ")
		vim.pack.update(packages)
	end
end, { nargs = "?" })

vim.api.nvim_create_user_command("PackDel", function(opts)
	if opts.args == "" then
		vim.pack.del({})
	else
		local packages = vim.split(opts.args, " ")
		vim.pack.del(packages)
	end
end, { nargs = "?" })
