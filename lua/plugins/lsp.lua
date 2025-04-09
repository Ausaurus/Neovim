return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "williamboman/mason.nvim",
            },
            {
                "williamboman/mason-lspconfig.nvim",
            },
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
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require("mason").setup()
            require("mason-lspconfig").setup()
            require('lspconfig').lua_ls.setup{
                capabilities = capabilities,
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                        diagnostics = {
                            disable = { "missing-fields" },
                        },
                    },
                },
            }
            --[[
            require('lspconfig').pylsp.setup{
                settings = {
                    pylsp = {
                        plugins = {
                            pyflakes = {
                                enabled = true
                            },
                            pylint = {
                                enabled = true
                            },
                            pycodestyle = {
                                ignore = {'W391'},
                                maxLineLength = 80
                            }
                        }
                    }
                }
            }
            --]]
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
            require('lspconfig').pyright.setup{
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true
                        }
                    }
                }

            }
            require('lspconfig').ast_grep.setup{}
            require('lspconfig').clangd.setup{
                capabilities = capabilities,
            }
            end,
        },
    }
