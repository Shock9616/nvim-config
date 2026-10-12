# Neovim Config

<img width="1341" height="956" alt="Screenshot 2026-10-12 at 12 34 09 AM" src="https://github.com/user-attachments/assets/a300375b-4d59-408e-b16d-090550425f2e" />

This is my personal Neovim config. I primarily use it for note taking in
markdown and programming course work at university, so configured language
support changes/expands pretty frequently

## Plugins

| Plugin                                                                               | Purpose                                                               | Config File                                                                                          |
| ------------------------------------------------------------------------------------ | --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| [blink.cmp](https://github.com/Saghen/blink.cmp)                                     | Autocompletion                                                        | [blink.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/blink.lua)                     |
| [catppuccin/nvim](https://github.com/catppuccin/nvim)                                | Colour scheme                                                         | [catppuccin.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/catppuccin.lua)           |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                             | Code formatting                                                       | [conform.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/conform.lua)                 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                          | Visualize git changes                                                 | [gitsigns.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/gitsigns.lua)               |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                         | Statusline                                                            | [lualine.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/lualine.lua)                 |
| [mdkite.nvim](https://github.com/selimacerbas/mdkite.nvim)                           | Live Markdown Preview                                                 | [mdkite.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/mdkite.lua)                   |
| [mini.nvim](https://github.com/nvim-mini/mini.nvim)                                  | Picker, file explorer, autopair, surround, and snippets               | [mini.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/mini.lua)                       |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Nice markdown highlighting                                            | [render-markdown.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/render-markdown.lua) |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)                | Seamless integration between neovim and multiplexer splits            | [smart-splits.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/smart-splits.lua)       |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                | Code parsing for syntax highlighting, more complex text objects, etc. | [treesitter.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/treesitter.lua)           |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                                | Diagnostics, todo comments, etc. list                                 | [trouble.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/trouble.lua)                 |
| [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)                      | Auto format tables in markdown                                        | [vim-table-mode.lua](https://github.com/Shock9616/nvim-config/blob/main/plugin/vim-table-mode.lua)   |

## Dependencies

- Install via system package manager

- **LSP**:
  - luals (lua)
  - ty (python)
  - ruff (python)
  - clangd (c/c++)
  - sourcekit (swift)
  - marksman (markdown)
  - hls (haskell)
  - rust-analyzer (rust)
  - jdtls (java)
- **Formatters**:
  - stylua (lua)
  - ruff_format (python)
  - ruff_fix (python)
  - ruff_organize_imports (python)
  - rustfmt (rust)
  - clang_format (c/c++/java)
  - jq (json)
  - deno_fmt (markdown)
  - prettier (html/css/js)
  - typstyle (typst)
  - sleek (sql)
- **Other**:
  - curl
  - git
  - tree-sitter
  - node
  - ripgrep
  - rd
