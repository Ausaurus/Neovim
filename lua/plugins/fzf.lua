return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
        vim.keymap.set('n', '<leader>pf', require("fzf-lua").files, { desc = "Fzf files" })
        vim.keymap.set('n', '<leader>ps', require("fzf-lua").live_grep, { desc = "Fzf files" })
        vim.keymap.set('n', '<leader>pm', require("fzf-lua").marks, { desc = "Fzf files" })


    end
}
