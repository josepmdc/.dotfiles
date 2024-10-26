-- expects the name of the config file
local function get_config(name)
    return function()
        require(string.format("config.%s", name))
    end
end

-- bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Color Theme
    require 'plugins.colors',
    -- Autocomplete
    require 'plugins.autocomplete',
    -- Autoformat
    require 'plugins.autoformat',
    -- Syntax highlighting
    require 'plugins.treesitter',
    -- LSP
    require 'plugins.lsp',
    -- Telescope
    require 'plugins.telescope',
    -- LaTeX
    { "lervag/vimtex" },
    -- Git
    { "tpope/vim-fugitive" },
    require 'plugins.gitsigns',
    -- Copilot
    { "github/copilot.vim" },
    -- Zen mode
    { "folke/zen-mode.nvim" },
    -- auto-pairs
    require 'plugins.autopairs',
    -- debugger
    require 'plugins.debug',
    -- add indentation guides
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
    -- linting
    require 'plugins.lint',
    -- autopairs
    require 'plugins.autopairs',
    -- file tree
    require 'plugins.neo-tree',
    -- bufferline
    require 'plugins.bufferline',
    -- status bar
    {
        "nvim-lualine/lualine.nvim",
        config = get_config("lualine"),
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- Go
    require 'plugins.go',
    -- LSP lines
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },
    -- Pretty notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup()
            vim.notify = require("notify")
        end,
    },
}

require("lazy").setup(plugins, {})
