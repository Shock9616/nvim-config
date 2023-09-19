-- Custom nvim-cmp source for RobotC

local completions = {}

local registered = false

completions.setup = function()
	if registered then
		return
	end
	registered = true

	local cmp_status_ok, cmp = pcall(require, "cmp")

	if not cmp_status_ok then
		return
	end

	local config = vim.fn.expand("~/.config/nvim/lua/user/cmp_sources/robc.json")
	if vim.fn.filereadable(config) == 0 then
		return
	end

	local funcs = vim.fn.json_decode(vim.fn.readfile(config))

	local source = {}

	source.new = function()
		return setmetatable({}, { __index = source })
	end

	source.get_trigger_characters = function()
		return { "@" }
	end

	source.complete = function(self, request, callback)
		local input = string.sub(request.context.cursor_before_line, request.offset - 1)
		local prefix = string.sub(request.context.cursor_before_line, 1, request.offset - 1)

		if vim.startswith(input, "@") and (prefix == "@" or vim.endswith(prefix, " @")) then
			local items = {}
			for completion, func in pairs(funcs) do
				table.insert(items, {
					label = completion,
					textEdit = {
						newText = completion,
						range = {
							start = {
								line = request.context.cursor.row - 1,
								character = request.context.cursor.col - 1 - #input,
							},
							["end"] = {
								line = request.context.cursor.row - 1,
								character = request.context.cursor.col - 1,
							},
						},
					},
				})
			end
			callback({
				items = items,
				isIncomplete = true,
			})
		else
			callback({ isIncomplete = true })
		end
	end

	cmp.register_source("robc", source.new())

	cmp.setup.filetype("c", {
		sources = {
			{ name = "robc" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
	})
end

return completions
