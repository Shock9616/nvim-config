--lsp
-- lsp.lua
--
-- LSP Configurations
--

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		vim.keymap.set(
			"n",
			"gd",
			require("telescope.builtin").lsp_definitions,
			{ buffer = event.buf, desc = "LSP: [G]oto [D]efinition" }
		)
		vim.keymap.set(
			"n",
			"gr",
			require("telescope.builtin").lsp_references,
			{ buffer = event.buf, desc = "LSP: [G]oto [R]eferences" }
		)
		vim.keymap.set(
			"n",
			"gI",
			require("telescope.builtin").lsp_implementations,
			{ buffer = event.buf, desc = "LSP: [G]oto [Implementation]" }
		)
		vim.keymap.set(
			"n",
			"<leader>lD",
			require("telescope.builtin").lsp_type_definitions,
			{ buffer = event.buf, desc = "Type [D]efinition" }
		)
		vim.keymap.set(
			"n",
			"<leader>lds",
			require("telescope.builtin").lsp_document_symbols,
			{ buffer = event.buf, desc = "[D]ocument [S]ymbols" }
		)
		vim.keymap.set(
			"n",
			"<leader>lws",
			require("telescope.builtin").lsp_dynamic_workspace_symbols,
			{ buffer = event.buf, desc = "[W]orkspace [S]ymbols" }
		)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf, desc = "[R]ename" })
		vim.keymap.set("n", "<leader>la", function()
			vim.lsp.buf.code_action()
		end, { buffer = event.buf, desc = "Code [A]ction" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP: Hover Documentation" })
		vim.keymap.set("n", "gD", "vim.lsp.buf.declaration", { buffer = event.buf, desc = "LSP: [G]oto [D]eclaration" })

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
		end

		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			vim.keymap.set("n", "<leader>lh", function()
				vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
			end, { buffer = event.buf, desc = "Toggle Inlay [H]ints" })
		end
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
	callback = function(event)
		vim.lsp.buf.clear_references()
		vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event.buf })
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- TODO: Setup language servers
local servers = {
	clangd = {},
	pyright = {},
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = { disable = { "missing-fields" } },
			},
		},
	},
}

require("mason").setup({
	ui = {
		border = "rounded",
	},
})

-- Set keymap to open Mason UI
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"clang-format",
	"clangd",
	"codelldb",
	"cpplint",
	"mdformat",
	"pyright",
	"ruff",
	"stylua",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})

local diagnostics_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(diagnostics_signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
