require("lazy").setup({
  -- Import plugin configurations
  { import = "plugins" },
}, {
  install = {
    colorscheme = { "rose-pine" },
  },
  checker = {
    enabled = true,
  },
})
