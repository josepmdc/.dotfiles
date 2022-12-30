local colors = {
    yellow   = '#ECBE7B',
    green    = '#98be65',
    red      = '#ec5f67',
    darkblue = '#081633',
}

require('lualine').setup({
    options = {
        theme = 'seoul256',
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'branch', separator = { left = '', right = '' } },
        },
        lualine_b = {
            {
                'diff',
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.yellow },
                    removed = { fg = colors.red },
                },
            },
            {
                'filename',
                path = 1,
            }
        },
        lualine_c = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    color_error = { fg = colors.red },
                    color_warn = { fg = colors.yellow },
                    color_info = { fg = colors.darkblue },
                },
            }
        },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
})
