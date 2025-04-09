return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
    },
    config = function()
        -- Setup DAP adapter for LLDB
        require('dap').adapters.lldb = {
            type = 'executable',
            command = '/usr/bin/lldb-vscode',  -- Path to lldb-vscode
            name = 'lldb'
        }

        -- Configure debug settings for C/C++
        require('dap').configurations.cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                -- Optional: Environment variables
                env = {
                    MY_ENV_VAR = 'value'
                },
            },
        }
        -- (Optional) Extend configurations to other languages
        require('dap').configurations.c = require('dap').configurations.cpp
        require("dapui").setup()
        require("nvim-dap-virtual-text").setup()

        -- Auto-open UI when debugging starts
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"]=function()
            dapui.close()
        end
        vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
        vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
        vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
        vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
        vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    end
}
