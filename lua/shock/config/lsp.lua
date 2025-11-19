--
-- lsp.lua
--
-- Language Server Config
--

-- Lua
vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
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
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },
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
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
    },
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

-- Swift
vim.lsp.config["sourcekit"] = {
    cmd = { "sourcekit-lsp" },
    filetypes = { "swift", "objc" },
    root_markers = {
        "*.xcodeproj",
        "*.xcworkspace",
        ".swift-format",
        "buildServer.json",
        ".git",
    },
    capabilities = {
        textDocument = {
            diagnostic = {
                dynamicRegistration = true,
                relatedDocumentSupport = true,
            },
        },
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
}

-- Markdown
vim.lsp.config["marksman"] = {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    root_markers = { ".marksman.toml", ".git" },
    single_file_support = true,
}

-- Haskell
vim.lsp.config["hls"] = {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell", "lhaskell" },
    root_markers = { "hie.yaml", "stack.yaml", "cabal.project", "*.cabal", "package.yaml" },
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "ormolu"
        }
    },
}

-- Rust
vim.lsp.config["rust_analyzer"] = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" },
    capabilities = {
        experimental = {
            serverStatusNotification = true
        },
    },
    single_file_support = true,
}

-- Enable Language Servers
vim.lsp.enable({ "luals", "basedpyright", "clangd", "sourcekit", "marksman", "hls", "rust_analyzer" })

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
        vim.keymap.set("n", "<leader>lc", vim.lsp.codelens.run, { desc = "Run [C]odelens" })
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

-- Create LspStart and LspStop commands
vim.api.nvim_create_user_command("LspStart", function(opts)
    local name = opts.args
    ---@diagnostic disable-next-line:invisible
    local config = vim.lsp.config._configs[name]

    if not config then
        vim.notify("No configuration found for LSP server: " .. name, vim.log.levels.ERROR)
        return
    end

    vim.lsp.start(config)
end, {
    nargs = 1,
    complete = function()
        local items = {}
        ---@diagnostic disable-next-line:invisible
        for name, config in pairs(vim.lsp.config._configs) do
            if type(config) == "table" and name ~= "*" then
                table.insert(items, name)
            end
        end
        return items
    end,
})

vim.api.nvim_create_user_command("LspStop", function(opts)
    local name = opts.args
    if not name or name == "" then
        vim.notify("Please provide a server name", vim.log.levels.ERROR)
        return
    end

    for _, client in pairs(vim.lsp.get_clients()) do
        if client.name == name then
            client:stop()
            return
        end
    end

    vim.notify("No active LSP client found with name: " .. name, vim.log.levels.ERROR)
end, {
    nargs = 1,
    complete = function(_, _, _)
        local names = {}
        for _, client in pairs(vim.lsp.get_clients()) do
            table.insert(names, client.name)
        end
        return names
    end,
})

vim.api.nvim_create_user_command("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })
