# Neovim Config

<img width="841" height="600" alt="Screenshot 2026-02-04 at 10 56 12 AM" src="https://github.com/user-attachments/assets/2c3ca888-10cb-464a-8d97-463bc9b17499" />

This is my personal Neovim config. I primarily use it for note taking in
markdown and programming course work at university, so configured language
support changes/expands pretty frequently

## Plugins

| Plugin                                                                               | Purpose                                                               | Config File                                                                                                         |
| ------------------------------------------------------------------------------------ | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| [blink.cmp](https://github.com/Saghen/blink.cmp)                                     | Autocompletion                                                        | [blink.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/blink.lua)                         |
| [catppuccin/nvim](https://github.com/catppuccin/nvim)                                | Colour scheme                                                         | [catppuccin.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/catppuccin.lua)               |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                             | Code formatting                                                       | [conform.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/conform.lua)                     |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                                 | Debugging                                                             | [dap.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/dap.lua)                             |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                          | Visualize git changes                                                 | [gitsigns.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/gitsigns.lua)                   |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim)                                | LuaLS setup for nvim config                                           | [lazydev.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/lazydev.lua)                     |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                      | Plugin manager                                                        | [lazy.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/lazy.lua)                                   |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)             | Live markdown rendering (for previewing)                              | [markdown-preview.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/markdown-preview.lua)   |
| [mini-files](https://github.com/nvim-mini/mini.files)                                | File browser                                                          | [mini-files.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/mini-files.lua)               |
| [mini-surround](https://github.com/nvim-mini/mini.surround)                          | Fast addition of surrounding characters (`()`, `""`, etc.)            | [mini-surround.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/mini-surround.lua)         |
| [noice.nvim](https://github.com/folke/noice.nvim)                                    | Nicer cmdline                                                         | [noice.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/noice.lua)                         |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Nice markdown highlighting                                            | [render-markdown.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/render-markdown.lua)     |
| [rustowl](https://github.com/cordx56/rustowl?tab=readme-ov-file#neovim)              | Rust lifetimes visualization                                          | [rustowl.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/rustowl.lua)                     |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)                | Seamless integration between neovim and multiplexer splits            | [smart-splits.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/smart-splits.lua)           |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)                    | Cursor animation (for easier visual tracking)                         | [smear-cursor.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/smear-cursor.lua)           |
| [snacks.nvim](https://github.com/folke/snacks.nvim?tab=readme-ov-file)               | Fuzzy finder, nice notifications, and other QoL features              | [snacks.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/snacks.lua)                       |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)                    | Mark todo, note, etc. comments                                        | [todo-comments.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/todo-comments.lua)         |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                | Code parsing for syntax highlighting, more complex text objects, etc. | [treesitter.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/treesitter.lua)               |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                                | Diagnostics, todo comments, etc. list                                 | [trouble.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/trouble.lua)                     |
| [ultimate-autopair.nvim](https://github.com/altermo/ultimate-autopair.nvim)          | Autopair surrounding characters (`()`, `""`, etc.)                    | [ultimate-autopair.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/ultimate-autopair.lua) |
| [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)                      | Auto format tables in markdown                                        | [vim-table-mode.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/vim-table-mode.lua)       |
| [witch-line](https://github.com/sontungexpt/witch-line)                              | Statusline                                                            | [witch-line.lua](https://github.com/Shock9616/nvim-config/blob/main/lua/shock/plugins/witch-line.lua)               |

## Dependencies

- Install via system package manager

- **LSP**:
  - luals (lua)
  - basedpyright (python)
  - clangd (c/c++)
  - sourcekit (swift)
  - marksman (markdown)
  - hls (haskell)
  - rust-analyzer (rust)
- **DAP**:
  - lldb (c/c++)
- **Formatters**:
  - stylua (lua)
  - ruff_format (python)
  - ruff_fix (python)
  - ruff_organize_imports (python)
  - rustfmt (rust)
  - clang_format (c/c++/java)
  - jq (json)
  - deno_fmt (markdown)
  - cbfmt (markdown)
  - prettier (html/css/js)
- **Other**:
  - curl
  - git
  - tree-sitter
  - node
  - ripgrep
  - rd
