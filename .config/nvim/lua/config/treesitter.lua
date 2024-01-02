require 'nvim-treesitter.configs'.setup {
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
    },
    highlight = {
        enable = true,
        disable = { "latex" },
    }
}
