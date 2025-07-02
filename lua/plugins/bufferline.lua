return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        -- Enable close icons on tabs
        show_close_icon = true,
        show_buffer_close_icons = true,
        
        -- Separator style
        separator_style = "slant", -- "slant", "thick", "thin", "padded_slant"
        
        -- Show buffer numbers
        numbers = "ordinal", -- "none", "ordinal", "buffer_id", "both"
        
        -- Diagnostics integration
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or "" )
            s = s .. n .. sym
          end
          return s
        end,
        
        -- Offset for nvim-tree
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true
          }
        },
        
        -- Hover functionality
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        
        -- Custom filtering
        custom_filter = function(buf_number, buf_numbers)
          -- Filter out certain filetypes
          local filetype = vim.bo[buf_number].filetype
          if filetype == "qf" or filetype == "help" then
            return false
          end
          return true
        end,
      }
    })
  end,
}
