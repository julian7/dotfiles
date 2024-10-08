local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true

require('lazy').setup({
    -- color scheme
    'RRethy/nvim-base16',
    {
        -- brings you to frequently used files
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- {
    --     "mistricky/codesnap.nvim",
    --     build = "make",
    -- },
    -- LSP icons like in vscode
    'onsails/lspkind.nvim',
    {
        -- Markdown preview
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- wrd wrapping
    "preservim/vim-pencil",
    -- {
    --     "epwalsh/obsidian.nvim",
    --     version = "*", -- recommended, use latest release instead of latest commit
    --     lazy = true,
    --     ft = "markdown",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    -- },
    -- remove distractions
    'folke/zen-mode.nvim',
    -- 'tpope/vim-obsession',
    -- Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    -- Database
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
    {
        "tpope/vim-dadbod",
        opt = true,
        requires = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            require("dotfiles.config.dadbod").setup()
        end,
    },
    {
        -- floating terminal
        'numToStr/FTerm.nvim',
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            require 'FTerm'.setup({
                blend = 5,
                dimensions = {
                    height = 0.90,
                    width = 0.90,
                    x = 0.5,
                    y = 0.5
                }
            })
        end
    },

    {
        -- LSP goto defs, type defs, implementations, declarations and references
        -- in floating windows
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {
                width = 120, -- Width of the floating window
                height = 15, -- Height of the floating window
                border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
                default_mappings = true,
                debug = false, -- Print debug information
                opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
                resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
                post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
                references = { -- Configure the telescope UI for slowing the references cycling window.
                    telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
                },
                -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
                focus_on_open = true,                                        -- Focus the floating window when opening it.
                dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
                force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
                stack_floating_preview_windows = true,                       -- Whether to nest floating windows
                preview_window_title = { enable = true, position = "left" }, -- Whether
            }
        end
    },

    {
        -- better diagnostics for LSP
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        -- cmdline, messages, popupmenu replacement
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                -- add any options here
                routes = {
                    {
                        filter = {
                            event = 'msg_show',
                            any = {
                                { find = '%d+L, %d+B' },
                                { find = '; after #%d+' },
                                { find = '; before #%d+' },
                                { find = '%d fewer lines' },
                                { find = '%d more lines' },
                            },
                        },
                        opts = { skip = true },
                    }
                },
            })
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- go development
    'ray-x/go.nvim',
    -- lua gui and util library (shouldn't it be a dependency instead?)
    'ray-x/guihua.lua',
    {
        -- nice indenter for code block begin / end
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        -- LSP configs
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
        },
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
    },

    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },

    -- Git related plugins
    'tpope/vim-fugitive',
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        -- statusline
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {
        -- indent guides
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- Fuzzy Finder (files, lsp, etc)
    -- {
    --     'nvim-telescope/telescope.nvim',
    --     branch = '0.1.x',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    -- },
    -- 'nvim-telescope/telescope-symbols.nvim',
    -- -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
    -- {
    --     "folke/twilight.nvim",
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     }
    -- },
    {
        'ibhagwan/fzf-lua',
        -- optional for icon support
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- calling 'setup' is optional for customization
            require('fzf-lua').setup({
                defaults = {
                    git_icons = true,
                    file_icons = true,
                    color_icons = true,
                }
            })
        end,
    },
})
