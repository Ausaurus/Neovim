return {
    "christoomey/vim-tmux-navigator",
    init = function()
        -- Disable default <C-h/j/k/l> maps so only our Alt maps apply
        vim.g.tmux_navigator_no_mappings = 1
    end,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "<M-h>", "<cmd>TmuxNavigateLeft<cr>" },
        { "<M-j>", "<cmd>TmuxNavigateDown<cr>" },
        { "<M-k>", "<cmd>TmuxNavigateUp<cr>" },
        { "<M-l>", "<cmd>TmuxNavigateRight<cr>" },
        -- optional “previous” jump:
        { "<M-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
}

