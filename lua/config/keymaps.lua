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

-- Buffer/Tab navigation keymaps (add these to your existing keymaps.lua)

-- Navigate between buffers/tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer/tab' })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer/tab' })

-- Move buffers/tabs
vim.keymap.set('n', '<leader>bn', ':BufferLineMoveNext<CR>', { desc = 'Move buffer right' })
vim.keymap.set('n', '<leader>bp', ':BufferLineMovePrev<CR>', { desc = 'Move buffer left' })

-- Close buffers/tabs
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { desc = 'Pick buffer to close' })

-- Go to specific buffer by number
vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer 6' })
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer 7' })
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer 8' })
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer 9' })

-- Pick buffer
vim.keymap.set('n', '<leader>bb', ':BufferLinePick<CR>', { desc = 'Pick buffer' })

-- Close all buffers except current
vim.keymap.set('n', '<leader>bo', ':BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })

-- Close all buffers to the right/left
vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>', { desc = 'Close buffers to the right' })
vim.keymap.set('n', '<leader>bl', ':BufferLineCloseLeft<CR>', { desc = 'Close buffers to the left' })

-- Trouble.nvim keymaps

-- Toggle trouble list
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle Trouble" })

-- Workspace diagnostics
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
  { desc = "Workspace Diagnostics" })

-- Document diagnostics
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
  { desc = "Document Diagnostics" })

-- Quickfix list
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix List" })

-- Location list
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Location List" })

-- LSP references
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "LSP References" })

-- Navigate between diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- Navigate between errors only
vim.keymap.set("n", "[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous Error" })

vim.keymap.set("n", "]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })

-- Show line diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })

-- Toggle lsp_lines (if using lsp_lines plugin)
vim.keymap.set("n", "<leader>tl", function()
  require("lsp_lines").toggle()
end, { desc = "Toggle LSP Lines" })
