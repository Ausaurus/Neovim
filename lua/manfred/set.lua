vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Set maximum line width (e.g., 80 characters)
vim.opt.textwidth = 80
--[[
-- Enable auto-wrapping using textwidth
vim.opt.formatoptions:append('t')  -- Auto-wrap text

-- Allow breaking lines in insert mode (remove 'l' if present)
vim.opt.formatoptions:remove('l')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text', 'gitcommit' },
  callback = function()
    vim.bo.textwidth = 80    -- Set line width
    vim.wo.wrap = true
    vim.bo.formatoptions = vim.bo.formatoptions:gsub('l', '') -- Remove 'l'
  end
})
--]]
vim.opt.modeline = false
vim.opt.modelines = 0
