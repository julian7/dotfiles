-- save as we know it; even on dvorak
vim.keymap.set('', '<D-s>', ':w<CR>')
vim.keymap.set('i', '<D-s>', '<ESC>:w<CR>')
vim.keymap.set('', '<D-o>', ':w<CR>')
vim.keymap.set('i', '<D-o>', '<ESC>:w<CR>')

-- Move around splits
vim.keymap.set('n', "<c-j>", "<c-w>j", { noremap = true })
vim.keymap.set('n', "<c-k>", "<c-w>k", { noremap = true })
vim.keymap.set('n', "<c-h>", "<c-w>h", { noremap = true })
vim.keymap.set('n', "<c-l>", "<c-w>l", { noremap = true })
vim.keymap.set('n', "<c-Down>", "<c-w>j", { noremap = true })
vim.keymap.set('n', "<c-Up>", "<c-w>k", { noremap = true })
vim.keymap.set('n', "<c-Left>", "<c-w>h", { noremap = true })
vim.keymap.set('n', "<c-Right>", "<c-w>l", { noremap = true })

-- Ruby/rails files
vim.keymap.set('', '<leader>gg', ':topleft 100 :split Gemfile<cr>')
vim.keymap.set('', '<leader>gr', ':topleft :split config/routes.rb<cr>')

