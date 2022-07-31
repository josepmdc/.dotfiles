local map = vim.keymap.set
local silent = { silent = true }

--Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", silent)
vim.g.mapleader = " "

-- Insert new line and stay in normal mode
map("n", "<leader>o", "o<Esc>", silent)
map("n", "<leader>O", "O<Esc>", silent)

--Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Shift up/down to scroll
map("n", "<S-Down>", "<C-E>", silent)
map("n", "<S-Up>", "<C-Y>", silent)

-- search selected text
map("v", "//", "y/\\V<C-R>=escape(@\",'/\')<CR><CR>", silent)

-- clear search
map("n", "<leader><space>", ":noh<CR>", silent)

-- save
map("n", "<leader>w", ":up<CR>", silent)

-- == Telescope ==
map("n", "<C-p>", ":Telescope find_files<CR>", silent)
map("n", "<C-f>", ":Telescope live_grep<CR>", silent)
map("n", "<C-l>", ":Telescope buffers<CR>", silent)

-- == Trouble ==
map("n", "<leader>t", ":TroubleToggle workspace_diagnostics<CR>", silent)
map("n", "<leader>r", ":TroubleToggle lsp_references<CR>", silent)

-- == Open URL in browser ==
map("n", "gx", ":!open <cWORD><CR>", silent)

--  == Change buffer ==
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", silent)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", silent)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", silent)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", silent)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", silent)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", silent)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", silent)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", silent)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", silent)
map("n", "<Tab>"    , ":BufferLineCycleNext<CR>"   , silent)
map("n", "<S-Tab>"  , ":BufferLineCyclePrev<CR>"   , silent)

-- == File tree ==
map("n", "<C-b>", ":NvimTreeToggle<CR>", silent)

-- delete without yanking
map({ "n", "v" }, "<leader>d", '"_d', silent)

-- replace selected text yanking it
map("v", "<leader>p", '"_dP', silent)

-- Toggle lsp_lines
map("n", "<leader>e", require("lsp_lines").toggle, silent)

-- ESC to exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>")
