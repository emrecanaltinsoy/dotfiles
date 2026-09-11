return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>r"] = { name = "+IronOptions", icon = "🐍" },
      },
    },
  },

  {
    "Vigemus/iron.nvim",
    lazy = true,
  },
}
