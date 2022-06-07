local lspconfig = require('lspconfig')

vim.api.nvim_command(
    "autocmd CursorHold * lua vim.diagnostic.open_float(0, {scope='cursor', focusable=false})"
)

-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false, -- { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

local signs = { Error = " ", Warning = " ", Hint = " ", Information = "ⓘ " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local servers = { "gopls", "pyright", "clangd", "rust_analyzer" }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end
