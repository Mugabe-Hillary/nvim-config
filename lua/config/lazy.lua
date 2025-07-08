require("lazy").setup({
  -- Import plugin configurations
  { import = "plugins" },
}, {
  install = {
    colorscheme = { "onedark" },
  },
  checker = {
    enabled = true,
  },
})
