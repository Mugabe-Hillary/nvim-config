return {
  -- Trouble.nvim for error/warning list and navigation
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        position = "bottom",                           -- position of the list can be: bottom, top, left, right
        height = 10,                                   -- height of the trouble list when position is top or bottom
        width = 50,                                    -- width of the list when position is left or right
        icons = true,                                  -- use devicons for filenames
        mode = "workspace_diagnostics",                -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        severity = nil,                                -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
        fold_open = "",                                -- icon used for open folds
        fold_closed = "",                              -- icon used for closed folds
        group = true,                                  -- group results by file
        padding = true,                                -- add an extra new line on top of the list
        cycle_results = true,                          -- cycle item list when reaching beginning or end of list
        action_keys = {                                -- key mappings for actions in the trouble list
          close = "q",                                 -- close the list
          cancel = "<esc>",                            -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r",                               -- manually refresh
          jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
          open_split = { "<c-x>" },                    -- open buffer in new split
          open_vsplit = { "<c-v>" },                   -- open buffer in new vsplit
          open_tab = { "<c-t>" },                      -- open buffer in new tab
          jump_close = { "o" },                        -- jump to the diagnostic and close the list
          toggle_mode = "m",                           -- toggle between "workspace" and "document" diagnostics mode
          switch_severity = "s",                       -- switch "diagnostics" severity filter level
          toggle_preview = "P",                        -- toggle auto_preview
          hover = "K",                                 -- opens a small popup with the full multiline message
          preview = "p",                               -- preview the diagnostic location
          open_code_href = "c",                        -- if present, open a URI with more information about the diagnostic error
          close_folds = { "zM", "zm" },                -- close all folds
          open_folds = { "zR", "zr" },                 -- open all folds
          toggle_fold = { "zA", "za" },                -- toggle fold of current file
          previous = "k",                              -- previous item
          next = "j",                                  -- next item
          help = "?"                                   -- help menu
        },
        multiline = true,                              -- render multi-line messages
        indent_lines = true,                           -- add an indent guide below the fold icons
        win_config = { border = "single" },            -- window configuration for floating windows
        auto_open = false,                             -- automatically open the list when you have diagnostics
        auto_close = false,                            -- automatically close the list when you have no diagnostics
        auto_preview = true,                           -- automatically preview the location of the diagnostic
        auto_fold = false,                             -- automatically fold a file trouble list at creation
        auto_jump = { "lsp_definitions" },             -- for the given modes, automatically jump if there is only a single result
        include_declaration = true,                    -- for references, include the declaration of the current symbol in the results
        signs = {
          -- icons / text used for a diagnostic
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "",
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      })
    end,
  },

  -- Enhanced LSP virtual text (inline error messages like Error Lens)
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      -- Disable virtual_text since we're using lsp_lines
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  -- Alternative: If you prefer traditional virtual text with enhancements
  -- Comment out lsp_lines above and uncomment this section
  --[[
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require('tiny-inline-diagnostic').setup({
        signs = {
          left = "",
          right = "",
          diag = "●",
          arrow = "    ",
          up_arrow = "    ",
          vertical = " │",
          vertical_end = " └"
        },
        hi = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
          arrow = "NonText",
          background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
        },
        blend = {
          factor = 0.27,
        },
        options = {
          -- Show the source of the diagnostic
          show_source = false,

          -- Throttle the update of the diagnostic when moving cursor, in milliseconds
          throttle = 20,

          -- The minimum length of the message, otherwise it will be on a new line
          softwrap = 15,

          -- If multiple diagnostics are under the cursor, display all of them
          multiple_diag_under_cursor = false,

          -- Enable diagnostic message on all lines
          multilines = false,

          -- Show all diagnostics on the cursor line
          show_all_diags_on_cursorline = false,
        }
      })
    end
  }
  ]]
}
