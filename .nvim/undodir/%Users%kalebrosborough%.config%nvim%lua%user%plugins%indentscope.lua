Vim�UnDo� ����w<=�e��V�VP�v�������{�        },                             d��z    _�                             ����                                                                                                                                                                                                                                                                                                                                                             d��k     �                   �               5��                                         �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             d��n    �               {5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             d��t     �                   },5��                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             d��y    �                      return {   #    "echasnovski/mini.indentscope",   L    version = false, -- wait till new 0.7.0 release to put it back on semver   +    event = { "BufReadPre", "BufNewFile" },       opts = {         -- symbol = "▏",         symbol = "│",   )      options = { try_as_border = true },       },       init = function()   /      vim.api.nvim_create_autocmd("FileType", {           pattern = {             "help",             "alpha",             "dashboard",             "neo-tree",             "Trouble",             "lazy",             "mason",             "notify",             "toggleterm",             "lazyterm",   
        },           callback = function()   .          vim.b.miniindentscope_disable = true           end,         })       end,     }5��                                  �      5      5��