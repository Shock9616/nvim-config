--
-- lsp.lua
--
-- Language Server Config
--

-- Lua
vim.lsp.config["luals"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/love2d/library",
				},
			},
			diagnostics = {
				disable = { "missing-fields" },
			},
		},
	},
}

-- Python
vim.lsp.config["basedpyright"] = {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
		single_file_support = true,
	},
}

-- C/C++
vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	capabilities = {
		offsetEncoding = { "utf-8", "utf-16" },
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
	},
	single_file_support = true,
}

-- Markdown
vim.lsp.config["marksman"] = {
	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" },
	single_file_support = true,
}

-- Enable Language Servers
vim.lsp.enable({ "luals", "basedpyright", "clangd", "marksman" })

-- Setup custom diagnostics signs
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

-- Setup LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = ev.buf })
		vim.keymap.set("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, { desc = "[G]oto [D]efinition", buffer = ev.buf })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration", buffer = ev.buf })
		vim.keymap.set("n", "gi", function()
			Snacks.picker.lsp_implementations()
		end, { desc = "[G]oto [I]mplementations", buffer = ev.buf })
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "[G]oto Type Definition", buffer = ev.buf })
		vim.keymap.set("n", "gr", function()
			Snacks.picker.lsp_references()
		end, { desc = "[G]oto [R]eferences", buffer = ev.buf })
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "[G]oto [S]ignature Help" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[R]ename Symbol" })
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[F]ormat Buffer" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code [A]ction" })
		vim.keymap.set("n", "<leader>lD", function()
			Snacks.picker.lsp_type_definitions()
		end, { desc = "Type [D]efinitions" })
		if vim.lsp.get_client_by_id(ev.data.client_id).server_capabilities.inlayHintProvider then
			vim.keymap.set("n", "<leader>lh", function()
				if vim.lsp.inlay_hint.is_enabled() then
					vim.lsp.inlay_hint.enable(false)
				else
					vim.lsp.inlay_hint.enable(true)
				end
			end, { desc = "Toggle Inlay [H]ints" })
		end
	end,
})
