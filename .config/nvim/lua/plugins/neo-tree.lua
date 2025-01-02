return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '<C-b>', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['<C-b>'] = 'close_window',
                    ['F'] = function(state)
                        -- grep inside the directory where the cursor is on
                        local selected_path = state.tree:get_node():get_id()
                        require('telescope.builtin').live_grep({ search_dirs = { selected_path } })
                    end,
                },
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
        },
    },
}
