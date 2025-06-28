local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Live server
keymap("n", "<leader>ls", ":LiveServerStart<CR>")
keymap("n", "<leader>lx", ":LiveServerStop<CR>")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap("n", "<leader>fb", ":Telescope buffers<CR>")
keymap("n", "<leader>fh", ":Telescope help_tags<CR>")

-- LSP
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
keymap("n", "<leader>vd", vim.diagnostic.open_float)
keymap("n", "[d", vim.diagnostic.goto_next)
keymap("n", "]d", vim.diagnostic.goto_prev)
keymap("n", "<leader>vca", vim.lsp.buf.code_action)
keymap("n", "<leader>vrr", vim.lsp.buf.references)
keymap("n", "<leader>vrn", vim.lsp.buf.rename)

-- Toggle terminal (optional leader shortcut)
keymap("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

