require('bufferline').setup({
    options = {
        diagnostics = "nvim_diagnostic",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        numbers = function(opts)
            return string.format('%s', opts.ordinal)
        end,
        show_buffer_icons = false,
    }
})
