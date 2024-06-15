if vim.g.neovide then
    -- https://github.com/neovide/neovide/issues/2330
    vim.schedule(function()
        vim.cmd("NeovideFocus")
    end)

    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = ""
end
