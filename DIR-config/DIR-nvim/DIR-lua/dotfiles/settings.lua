vim.g.mapleader = " "
vim.cmd.colorscheme('base16-tomorrow-night')
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.guifont = { "JetBrains Mono", ":h15" }
vim.opt.clipboard = "unnamed"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.winwidth = 80
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.switchbuf = "useopen"
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
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
