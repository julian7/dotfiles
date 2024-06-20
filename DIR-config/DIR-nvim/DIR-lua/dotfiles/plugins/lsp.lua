require("mason").setup()
local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    'ansiblels',
    'ember',
    'eslint',
    'golangci_lint_ls',
    'gopls',
    'lua_ls',
    'rust_analyzer',
})
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false }),
        ['<Tab>'] = cmp.mapping.confirm({select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }
})
