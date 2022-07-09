local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use({
        'neovim/nvim-lspconfig',
        config = get_config('lsp')
    })

    -- Color Theme
    use 'habamax/vim-gruvbit'

    -- Snippets
    use({ "rafamadriz/friendly-snippets" })
    use({
        "L3MON4D3/LuaSnip",
        requires = "saadparwaiz1/cmp_luasnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    })

    -- Autocomplete
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'L3MON4D3/LuaSnip',
        },
        config = get_config('cmp'),
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        config = get_config("treesitter"),
        run = ":TSUpdate",
    })

    use({
        'nvim-telescope/telescope.nvim',
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })

    -- LaTeX
    use 'lervag/vimtex'
    -- Git
    use 'tpope/vim-fugitive'
    -- Floating terminal
    use 'voldikss/vim-floaterm'
    -- Diagnostics
    use 'folke/trouble.nvim'
    -- Zen mode
    use 'folke/zen-mode.nvim'

    -- auto-pairs
    use({
        "windwp/nvim-autopairs",
        config = function() require('nvim-autopairs').setup() end
    })

    -- status bar
    use({
        "nvim-lualine/lualine.nvim",
        config = get_config("lualine"),
        event = "VimEnter",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- Buffer Tabs
    use({
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = get_config("bufferline"),
    })

    -- File tree
    use({ 
        "kyazdani42/nvim-tree.lua", 
        config = function() require'nvim-tree'.setup() end
    })

    -- Go
    use({ 
        "ray-x/go.nvim", 
        -- config = get_config("go"), 
        ft = { "go" } 
    })

    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
