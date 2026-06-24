vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.winborder = "rounded"
vim.o.swapfile = false
vim.o.clipboard = "unnamed"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.winwidth = 80
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.switchbuf = "useopen"
vim.o.wrap = false
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.guifont = "JetBrains Mono:h15"

vim.g.mapleader = " "

-- save as we know it; even on dvorak
vim.keymap.set('', '<D-s>', ':w<CR>')
vim.keymap.set('i', '<D-s>', '<ESC>:w<CR>')
vim.keymap.set('', '<D-o>', ':w<CR>')
vim.keymap.set('i', '<D-o>', '<ESC>:w<CR>')

vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<CR>', ':nohlsearch<CR>')

-- Go files
vim.keymap.set('', '<leader>gm', ':topleft 100 :split go.mod<CR>')

-- Python files
vim.keymap.set('', '<leader>pr', ':topleft 100 :split requirements.txt<CR>')

-- Ruby/Rails files
vim.keymap.set('', '<leader>rg', ':topleft 100 :split Gemfile<CR>')
vim.keymap.set('', '<leader>rr', ':topleft :split config/routes.rb<CR>')

-- Rust files
vim.keymap.set('', '<leader>rc', ':topleft 100 :split Cargo.toml<CR>')

-- mini.base16
local base16 = require('mini.base16')
base16.setup({
    -- tomorrow night
    palette = {
        base00 = '#1d1f21',
        base01 = '#282a2e',
        base02 = '#373b41',
        base03 = '#969896',
        base04 = '#b4b7b4',
        base05 = '#c5c8c6',
        base06 = '#e0e0e0',
        base07 = '#ffffff',
        base08 = '#cc6666',
        base09 = '#de935f',
        base0A = '#f0c674',
        base0B = '#b5bd68',
        base0C = '#8abeb7',
        base0D = '#81a2be',
        base0E = '#b294bb',
        base0F = '#a3685a',
    },
    use_cterm = true,
})

-- mini.pick
require('mini.pick').setup()
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<C-p>', ':Pick git_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>')

-- boole.nvim
require('boole').setup({
    mappings = {
        increment = '<C-a>',
        decrement = '<C-x>',
    },
})

-- nvim-tree
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')

-- lualine
require('lualine').setup({
    options = {
        theme = "tomorrow_night"
    }
})

-- lazygit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { silent = true })

-- trouble
require('trouble').setup()

-- go.nvim
require('go').setup()

-- indent-blankline
require('ibl').setup()

-- Comment.nvim
require('Comment').setup()

-- lsp
vim.lsp.enable({
    'ansiblels',
    'basedpyright',
    'biome',
    'golangci_lint_ls',
    'gopls',
    'luals',
    'ruff',
    'rust_analyzer',
})
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

-- other config
vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    eol = '¬',
    trail = '·',
    extends = '>',
    precedes = '<',
}
vim.opt.wildignore = {
    "*.class",
    "*.gem",
    "*.o",
    "*.obj",
    "*.out",
    "*.rar",
    "*.rbc",
    "*.svn",
    "*.swp",
    "*.tar.bz2",
    "*.tar.gz",
    "*.tar.xz",
    "*.tbz2",
    "*.tgz",
    "*.txz",
    "*.zip",
    "*/.bundle/*",
    "*/.sass-cache/*",
    "*/vendor/cache/*",
    "*/vendor/gems/*",
    "*~",
    ".DS_Store",
    "._*",
    "/node_modules/*",
    "/vendor/ruby/*",
    "vendor/cache/*",
}
