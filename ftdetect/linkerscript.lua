vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
    pattern = {"*.ld","*.lds"},
    callback = function() vim.bo.filetype = "linkerscript" end,
})
