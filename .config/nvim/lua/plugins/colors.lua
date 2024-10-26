return {
    "rebelot/kanagawa.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("kanagawa").setup({
            undercurl = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg = "#1d2021",
                            bg_gutter = "none",
                        },
                    },
                },
            },
        })
        require("kanagawa").load("dragon") -- wave (default), dragon, lotus
    end,
}
