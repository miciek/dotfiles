-- https://github.com/shortcuts/no-neck-pain.nvim
return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  lazy = false,
  priority = 1000,
  opts = {
    width = 175,
    autocmds = {
      enableOnVimEnter = true,
      enableOnVimEnter = true,
      reloadOnColorSchemeChange = true,
    }
  },
  config = function(_, opts)
    require('no-neck-pain').setup(opts)
  end,
}
