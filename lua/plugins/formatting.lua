return {
  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          python = { "black" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

  -- Color scheme
  -- lua/plugins/rose-pine.lua
  --   {
  --     "tiagovla/tokyodark.nvim",
  --     opts = {},
  --     config = function(_, opts)
  --         require("tokyodark").setup(opts) -- calling setup is optional
  --         vim.cmd([[colorscheme tokyodark]])
  --     end,
  --   },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
        },
      })
    end,
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Comment plugin
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Live server for web development
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    lazy = false,
    config = function()
      require("live-server").setup({
        args = { "--port=8080", "--browser=default" }
      })
    end,
  },

  -- Toggle terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]], -- Toggle terminal
        direction = "float",      -- or "horizontal", "vertical", "tab"
        float_opts = {
          border = "curved",
          winblend = 3,
        },
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        shade_terminals = true,
        shading_factor = 2,
      })

      -- Optional: Better navigation in terminal mode
      function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },


}
