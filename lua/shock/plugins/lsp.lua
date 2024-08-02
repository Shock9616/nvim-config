--
-- lsp.lua
--
-- LSP (Language Server Protocol) config
--

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"willamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		local lsp_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
			vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
		end

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
			callback = function(event)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event.buf })
			end,
		})

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Setup Mason for LS installation
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ruff",
				"clangd",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
								diagnostics = { disable = { "missing-fields" } },
							},
						},
					})
				end,
			},
		})

		-- Setup custom diagnostics signs
		local diagnostics_signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(diagnostics_signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end
	end,
}
