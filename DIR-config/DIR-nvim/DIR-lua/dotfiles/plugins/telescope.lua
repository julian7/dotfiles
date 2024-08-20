local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>ff', fzf.files, {})
vim.keymap.set('n', '<C-p>', fzf.git_files, {})
vim.keymap.set('n', '<leader>fg', fzf.live_grep, {})
vim.keymap.set('n', '<leader>fb', fzf.buffers, {})
vim.keymap.set('n', '<leader>fh', fzf.helptags, {})
