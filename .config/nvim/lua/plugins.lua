-- expects the name of the config file
local function get_config(name)
    return function()
        require(string.format('config.%s', name))
    end
end

-- bootstrap lazy.nvim if not installed
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

local plugins = {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
        },
        config = get_config('lsp'),
    },
    -- Color Theme
    {
        'rebelot/kanagawa.nvim',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('kanagawa').setup({
                undercurl = true,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg = "#1d2021",
                                bg_gutter = "none"
                            }
                        }
                    }
                }
            })
            require("kanagawa").load("dragon") -- wave (default), dragon, lotus
        end
    },
    -- Snippets
    { "rafamadriz/friendly-snippets" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = "saadparwaiz1/cmp_luasnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'L3MON4D3/LuaSnip',
        },
        config = get_config('cmp'),
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = get_config("treesitter"),
        build = ":TSUpdate",
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    },
    -- LaTeX
    { 'lervag/vimtex' },
    -- Git
    { 'tpope/vim-fugitive' },
    -- Diagnostics
    { 'folke/trouble.nvim' },
    -- Zen mode
    { 'folke/zen-mode.nvim' },
    -- auto-pairs
    {
        "windwp/nvim-autopairs",
        config = function() require('nvim-autopairs').setup() end
    },
    -- status bar
    {
        "nvim-lualine/lualine.nvim",
        config = get_config("lualine"),
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    -- Buffer Tabs
    {
        "akinsho/bufferline.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = get_config("bufferline"),
    },
    -- File tree
    {
        "kyazdani42/nvim-tree.lua",
        config = function() require 'nvim-tree'.setup() end
    },
    -- Go
    {
        "ray-x/go.nvim",
        ft = { "go" },
        config = function()
            require 'go'.setup({
                -- trouble = true,
                luasnip = true,
                icons = { breakpoint = '🔴', currentpos = '▶️' },
                test_runner = 'richgo',
                run_in_floaterm = true,
                floaterm = {
                    posititon = 'bottom', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
                    width = 0.75,
                    height = 0.5,
                },
                diagnostic = {
                    virtual_text = false,
                },
            })
        end,
        dependencies = { 'ray-x/guihua.lua' }
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            require("notify").setup()
            vim.notify = require("notify")
        end
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text"
        }
    },
}

require("lazy").setup(plugins, opts)
