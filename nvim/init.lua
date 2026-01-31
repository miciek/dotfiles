-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("ASToggle")
    vim.cmd("ASToggle")
  end,
})

vim.opt.shortmess:append("A") -- disable the "swap file found" popup, always edit
