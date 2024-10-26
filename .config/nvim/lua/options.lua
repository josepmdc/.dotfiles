local opt = vim.opt
local wo = vim.wo

-- convert tabs to spaces
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- sync clipboard between OS and Neovim.
opt.clipboard = "unnamedplus"

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- indent
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.termguicolors = true

-- don't show the mode, since it's already in the status line
opt.showmode = false

-- set highlight on search
opt.hlsearch = true

-- save undo history
opt.undofile = true

-- enable mouse mode
opt.mouse = "a"

-- keep signcolumn on by default
opt.signcolumn = 'yes'

-- decrease update time
opt.updatetime = 250

-- configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- opt.list = true
-- opt.listchars = { tab = '⇥ ', trail = '·', nbsp = '·' }

-- preview substitutions live, as you type!
opt.inccommand = 'split'

-- show which line your cursor is on
opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

wo.colorcolumn = "80"
wo.number = true
wo.relativenumber = true
wo.wrap = false

-- Disable lsp_lines plugin by default
vim.diagnostic.config({ virtual_lines = false })
vim.diagnostic.config({ virtual_text = false })
