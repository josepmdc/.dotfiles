return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "go",
            "python",
            "html",
            "javascript",
            "json",
            "markdown",
            "sql",
            "rust",
            "toml",
            "typescript",
            "vim",
            "vimdoc",
            "make",
            "yaml",
            "bash",
            "fish",
            "c",
            "cpp",
            "diff",
            "lua",
            "templ",
        },
        auto_install = true,
        highlight = {
            enable = true,
            disable = { "latex" },
        },
        indent = {
            enable = true,
        }
    },
    build = ":TSUpdate",
    config = function(_, opts)
        -- Prefer git instead of curl in order to improve connectivity in some environments
        require('nvim-treesitter.install').prefer_git = true
        require('nvim-treesitter.configs').setup(opts)
    end,
}
