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
		"saghen/blink.cmp",
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		local lsp_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr })
			vim.keymap.set("n", "gd", function()
				Snacks.picker.lsp_definitions()
			end, { desc = "[G]oto [D]efinition", buffer = bufnr })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration", buffer = bufnr })
			vim.keymap.set("n", "gi", function()
				Snacks.picker.lsp_implementations()
			end, { desc = "[G]oto [I]mplementations", buffer = bufnr })
			vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "[G]oto Type Definition", buffer = bufnr })
			vim.keymap.set("n", "gr", function()
				Snacks.picker.lsp_references()
			end, { desc = "[G]oto [R]eferences", buffer = bufnr })
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "[G]oto [S]ignature Help" })
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[R]ename Symbol" })
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[F]ormat Buffer" })
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code [A]ction" })
			vim.keymap.set("n", "<leader>lD", function()
				Snacks.picker.lsp_type_definitions()
			end, { desc = "Type [D]efinitions" })
			if client.server_capabilities.inlayHintProvider then
				vim.keymap.set("n", "<leader>lh", function()
					if vim.lsp.inlay_hint.is_enabled() then
						vim.lsp.inlay_hint.enable(false)
					else
						vim.lsp.inlay_hint.enable(true)
					end
				end, { desc = "Toggle Inlay [H]ints" })
			end
		end

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		-- Setup Mason for LS installation
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		-- Set keymap to open Mason UI
		vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "[M]ason" })

		require("mason-lspconfig").setup({
			ensure_installed = {
				-- Python
				"basedpyright",
				"ruff",

				-- C/C++
				"clangd",

				-- Lua
				"lua_ls",
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
								workspace = {
									library = {
										"${3rd}/love2d/library",
									},
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
