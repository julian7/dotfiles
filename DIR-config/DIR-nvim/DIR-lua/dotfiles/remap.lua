-- save as we know it; even on dvorak
vim.keymap.set('', '<D-s>', ':w<CR>')
vim.keymap.set('i', '<D-s>', '<ESC>:w<CR>')
vim.keymap.set('', '<D-o>', ':w<CR>')
vim.keymap.set('i', '<D-o>', '<ESC>:w<CR>')

-- Go files
vim.keymap.set('', '<leader>gm', ':topleft 100 :split go.mod<cr>')

-- Python files
vim.keymap.set('', '<leader>pr', ':topleft 100 :split requirements.txt<cr>')

-- Ruby/Rails files
vim.keymap.set('', '<leader>rg', ':topleft 100 :split Gemfile<cr>')
vim.keymap.set('', '<leader>rr', ':topleft :split config/routes.rb<cr>')

-- Rust files
vim.keymap.set('', '<leader>rc', ':topleft 100 :split Cargo.toml<cr>')
