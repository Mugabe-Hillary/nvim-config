require("lazy").setup({
  -- Import plugin configurations
  { import = "plugins" },
}, {
  install = {
    colorscheme = {  "tokyodark" },
  },
  checker = {
    enabled = true,
  },
})
