--
-- markdown-preview.lua
--
-- Browser-based rendering of markdown files
--

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "markdown-preview.nvim" and (kind == "install" or kind == "update") then
			vim.notify("Building markdown-preview", vim.log.levels.INFO)
			local obj = vim.system(
				{ "yarn", "install" },
				{ cwd = vim.fn.stdpath("data") .. "/site/pack/core/opt/markdown-preview.nvim/app" }
			):wait()
			if obj.code == 0 then
				vim.notify("Building markdown-preview done", vim.log.levels.INFO)
			else
				vim.notify("Building markdown-preview failed", vim.log.levels.ERROR)
			end
		end
	end,
})

vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })
