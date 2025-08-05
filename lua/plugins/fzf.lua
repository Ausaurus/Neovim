return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        -- Set up Telescope with custom configurations
        require('telescope').setup({
            defaults = {
                -- Add any default configurations here
            },
            pickers = {
                -- Add picker-specific configurations here
            },
            extensions = {
                -- Add extension configurations here
            },
            highlights = {
                TelescopeMatching = { fg = "#61afef" },  -- Blue color for matches
                TelescopeNormal = { fg = "#abb2bf" },     -- Grey8 color for normal text

                -- Border colors
                TelescopePreviewBorder = { bg = "#1e222a", fg = "#1e222a" },
                TelescopePromptBorder = { bg = "#1e222a", fg = "#1e222a" },
                TelescopeResultsBorder = { bg = "#1e222a", fg = "#1e222a" },

                -- Background colors
                TelescopePreviewNormal = { bg = "#1e222a" },
                TelescopePromptNormal = { bg = "#1e222a" },
                TelescopeResultsNormal = { bg = "#1e222a" },

                -- Title colors
                TelescopePreviewTitle = { fg = "#1e222a" },
                TelescopePromptTitle = { fg = "#1e222a" },
                TelescopeResultsTitle = { fg = "#1e222a" },

                -- Prompt prefix
                TelescopePromptPrefix = { bg = "#1e222a" },

                -- Selection colors
                TelescopeSelection = { fg = "#c678dd", bg = "#1e222a" },         -- Magenta-dark
                TelescopeSelectionCaret = { fg = "#c678dd", bg = "#1e222a" },    -- Magenta-dark
            }
        })

        -- Set up key mappings
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
