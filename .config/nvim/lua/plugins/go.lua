return {
    "ray-x/go.nvim",
    ft = { "go" },
    config = function()
        require('go').setup({
            luasnip = true,
            icons = { breakpoint = '🔴', currentpos = '▶️' },
            -- test_runner = 'gotestsum',
            run_in_floaterm = false,
            floaterm = {
                posititon = 'bottom', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
                width = 0.75,
                height = 0.5,
            },
            diagnostic = {
                virtual_text = false,
            },
        })

        local map = vim.keymap.set

        map("n", "<leader>gt", ":GoTestFile<CR>")
        map("n", "<leader>gts", ":GoTestSubCase<CR>")
    end,
    dependencies = { "ray-x/guihua.lua" },
}
