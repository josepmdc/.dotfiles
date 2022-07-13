local opt = vim.opt
local wo = vim.wo

opt.expandtab = true -- convert tabs to spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"
opt.ignorecase = true
opt.smartcase = true
opt.autoindent = true
opt.smartindent = true
opt.mouse = "a"
opt.updatetime = 500

opt.termguicolors = true
vim.cmd "colorscheme gruvbit"

wo.colorcolumn = "80"
wo.number = true
wo.relativenumber = true
wo.wrap = false

-- Limit line width on markdown files
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = "*.md", command = "set textwidth=79" }
)
