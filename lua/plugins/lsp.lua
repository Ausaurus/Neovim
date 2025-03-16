return {
    {
        'neovim/nvim-lspconfig',
        dependecies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            require('lspconfig').lua_ls.setup{}
            require('lspconfig').pylsp.setup{}
            require('lspconfig').bashls.setup{}
            require('lspconfig').textlsp.setup{
                settings = {
                    textLSP = {
                        analysers = {
                            languagetool = {
                                check_text = {
                                    on_change = true,
                                    on_open = true,
                                    on_save = true
                                },
                                enabled = true
                            }
                        },
                        documents = {
                            org = {
                                org_todo_keywords = { "TODO", "IN_PROGRESS", "DONE" }
                            }
                        }
                    }
                }

            }
        end,
    }
}
