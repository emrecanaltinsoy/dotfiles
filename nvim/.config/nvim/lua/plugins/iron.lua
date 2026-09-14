return {
  {
    "Vigemus/iron.nvim",
    init = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>r", group = "IronOptions", icon = "🐍" },
      })
    end,
    lazy = true,
  },
}
