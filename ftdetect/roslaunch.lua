-- ~/.config/nvim/ftdetect/roslaunch.lua
vim.filetype.add({
  pattern = {
    [".*%.launch"] = "roslaunch", -- Match all .launch files
  },
})
