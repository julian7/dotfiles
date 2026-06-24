local au = vim.api.nvim_create_autocmd

-- built-in treesitter highlighting
au("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- remove trailing whitespace
au("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Ruby filetype detection
au({"BufNewFile", "BufRead"}, {
    pattern = {"Thorfile", "Procfile", "Guardfile", "*.rake"},
    callback = function()
        vim.opt_local.filetype = "ruby"
    end,
})

-- tabsize: 2
au("FileType", {
    pattern = {"yaml", "json", "ruby", "makefile", "markdown"},
    callback = function()
        vim.opt_local.autoindent = true
        vim.opt_local.softtabstop = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- tabsize: 4, no expandtab
au("FileType", {
    pattern = {"go"},
    callback = function()
        vim.opt_local.autoindent = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false
    end,
})

-- tabsize: 8, no expandtab
au("FileType", {
    pattern = {"bindzone"},
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
    end,
})

-- markdown word wrap
au("FileType", {
    pattern = {"markdown"},
    callback = function()
        vim.opt_local.wrap = true
    end,
})
