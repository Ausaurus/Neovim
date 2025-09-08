return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lsp = require('lspconfig')
      local util = require('lspconfig.util')
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require("mason").setup()
      require("mason-lspconfig").setup{
        ensure_installed = { "clangd", "lua_ls", "pyright", "bashls" },
      }

      lsp.lua_ls.setup{
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      }

      --[[ Example pylsp config (kept commented as in your original)
      lsp.pylsp.setup{
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = true },
              pylint = { enabled = true },
              pycodestyle = { ignore = {'W391'}, maxLineLength = 80 },
            }
          }
        }
      }
      --]]

      lsp.bashls.setup{}

      lsp.textlsp.setup{
        settings = {
          textLSP = {
            analysers = {
              languagetool = {
                check_text = { on_change = true, on_open = true, on_save = true },
                enabled = true,
              },
            },
            documents = {
              org = { org_todo_keywords = { "TODO", "IN_PROGRESS", "DONE" } },
            },
          }
        }
      }

      lsp.pyright.setup{
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            }
          }
        }
      }

      lsp.ast_grep.setup{}

      -- ⭐ STM32/clangd setup
      lsp.clangd.setup{
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--query-driver=/usr/bin/arm-none-eabi-*", -- trust ARM GCC flags
        },
        -- Detect project root where your STM32 config/compile DB lives
        root_dir = function(fname)
          return util.root_pattern('compile_commands.json', '.clangd', 'Makefile', '.git')(fname)
              or util.path.dirname(fname)
        end,
        -- Helps before you have compile_commands.json; move these into .clangd later.
        init_options = {
          fallbackFlags = {
            "-xc",
            "-std=gnu11",
            "-DUSE_HAL_DRIVER",
            -- 🔁 CHANGE this to your exact MCU macro (e.g., STM32F103xB, STM32F411xE)
            "-DSTM32F103xB",
          },
        },
      }
    end,
  },
}

