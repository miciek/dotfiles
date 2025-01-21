-- add custom neo-tree options
-- see https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.width = 60
    opts.filesystem = {
      filtered_items = {
        visible = true,
        hide_gitignored = false,
        hide_dotfiles = false,
        hide_by_name = {},
        never_show = { ".git" },
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    }
  end,
}
