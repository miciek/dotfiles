return {
  "Pocco81/auto-save.nvim",
  opts = {
    execution_message = {
      message = function() -- message to print on save
        return ""
      end,
    },
    trigger_events = { "BufLeave", "ExitPre" }, -- vim events that trigger auto-save, e.g. "InsertLeave", "TextChanged", run :ASToggle twice when changing
  },
}
