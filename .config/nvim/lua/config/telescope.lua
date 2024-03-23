require('telescope').setup {
    extensions = {
        frecency = {
            show_scores = false,
            show_unindexed = true,
            default_workspace = 'CWD',
        }
    },
}
