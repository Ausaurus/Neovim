return {
    -- Add vim-ros for ROS file support
    {
        'taketwo/vim-ros',
        ft = { 'roslaunch', 'urdf', 'xacro', 'sdf', 'msg', 'srv' }, -- Load only for ROS filetypes
        config = function()
            -- Optional: Override ROS filetype detection (if needed)
            vim.g.ros_filetype_ftdetect = 1 -- Let vim-ros handle filetype detection
            -- Disable Tree-sitter for ROS files to avoid conflicts
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'roslaunch', 'urdf', 'xacro', 'sdf', 'msg', 'srv' },
                callback = function()
                    vim.treesitter.stop() -- Disable Tree-sitter for this buffer
                end,
            })
        end
    }
}

