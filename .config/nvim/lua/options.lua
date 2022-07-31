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

vim.notify = require("notify")

wo.colorcolumn = "80"
wo.number = true
wo.relativenumber = true
wo.wrap = false

-- Floating window background color
vim.highlight.create("NormalFloat", { guibg = "None", guifg = "None" }, false)

-- Disable lsp_lines plugin by default
vim.diagnostic.config({ virtual_lines = false })

-- Open diagnostics Floating window on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = {
                { "╭", "LspFloatWinBorder" },
                { "─", "LspFloatWinBorder" },
                { "╮", "LspFloatWinBorder" },
                { "│", "LspFloatWinBorder" },
                { "╯", "LspFloatWinBorder" },
                { "─", "LspFloatWinBorder" },
                { "╰", "LspFloatWinBorder" },
                { "│", "LspFloatWinBorder" },
            },
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

-- Limit line width on markdown files
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = "*.md", command = "set textwidth=79" }
)
