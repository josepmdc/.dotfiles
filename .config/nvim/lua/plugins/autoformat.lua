return {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
        {
            '<leader>ff',
            function()
                require('conform').format { async = true, lsp_fallback = true }
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function()
            return {
                lsp_format = "fallback",
                timeout_ms = 500,
            }
        end,
    },
}
