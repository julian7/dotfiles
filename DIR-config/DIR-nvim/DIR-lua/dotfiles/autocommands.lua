local au = vim.api.nvim_create_autocmd
local setlocal = vim.opt_local

-- remove trailing white space
au({"BufWritePre"}, {
    pattern = {"*"},
    callback = function ()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
-- detect ruby
au({"BufNewFile", "BufRead"}, {
    pattern = {"Thorfile", "Procfile", "Guardfile", "*.rake"},
    callback = function ()
        setlocal.filetype = "ruby"
    end
})

-- tabsize: 2
au("FileType", {
    pattern = {"yaml", "json", "ruby", "makefile", "markdown"},
    callback = function ()
        setlocal.autoindent = true
        setlocal.softtabstop = 2
        setlocal.tabstop = 2
        setlocal.shiftwidth = 2
    end,
})
-- tabsize: 4
au("FileType", {
    pattern = {"go"},
    callback = function ()
        setlocal.autoindent = true
        setlocal.tabstop = 4
        setlocal.shiftwidth = 4
        setlocal.expandtab = false
    end
})
-- tabsize: 8
au("FileType", {
    pattern = {"bindzone"},
    callback = function ()
        setlocal.expandtab = false
        setlocal.shiftwidth = 8
        setlocal.tabstop = 8
    end
})
-- markdown
au("FileType", {
    pattern = {"markdown"},
    callback = function ()
        vim.opt_local.wrap = true
    end,
})
-- markdown
au("FileType", {
    pattern = {"markdown"},
    callback = function ()
        vim.opt_local.wrap = true
    end,
})
