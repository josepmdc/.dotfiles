return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
        -- [[ Configure Telescope ]]
        require('telescope').setup {
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = {
                        height = 0.95,
                        preview_height = 0.70,
                    },
                },
            },
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        local map = vim.keymap.set
        map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
        map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
        map('n', '<leader><leader>', function() builtin.find_files({ hidden = true }) end, { desc = '[F]ind [F]iles' })
        map('n', '<leader>fb', builtin.builtin, { desc = '[F]ind [B]uiltin' })
        map('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
        map('n', '<leader>g', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        map('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        map('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
        map('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
        map('n', '<leader>fo', builtin.buffers, { desc = '[F]ind [O]pen buffers' })

        -- Slightly advanced example of overriding default behavior and theme
        map('n', '<leader>/', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        map('n', '<leader>f/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[F]ind [/] in Open Files' })

        -- Shortcut for searching your Neovim configuration files
        map('n', '<leader>fn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[F]ind [N]eovim files' })

        function vim.getVisualSelection()
            vim.cmd('noau normal! "vy"')
            local text = vim.fn.getreg('v')
            vim.fn.setreg('v', {})

            text = string.gsub(text, "\n", "")
            if #text > 0 then
                return text
            else
                return ''
            end
        end

        map('v', '<leader>ss', function()
            builtin.live_grep({ default_text = vim.getVisualSelection() })
        end)
    end,
}
