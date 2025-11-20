return {
  {
    "nickvandyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {},
    keys = {
      {
        "<leader>ot",
        function()
          require("opencode").toggle()
        end,
        desc = "toggle embedded opencode",
      },
      {
        "<leader>oa",
        function()
          require("opencode").ask()
        end,
        desc = "ask opencode",
        mode = "n",
      },
      {
        "<leader>oa",
        function()
          require("opencode").ask("@selection: ")
        end,
        desc = "ask opencode about selection",
        mode = "v",
      },
      {
        "<leader>op",
        function()
          require("opencode").select_prompt()
        end,
        desc = "select prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>on",
        function()
          require("opencode").command("session_new")
        end,
        desc = "new session",
      },
      {
        "<leader>oy",
        function()
          require("opencode").command("messages_copy")
        end,
        desc = "copy last message",
      },
      {
        "<s-c-u>",
        function()
          require("opencode").command("messages_half_page_up")
        end,
        desc = "scroll messages up",
      },
      {
        "<s-c-d>",
        function()
          require("opencode").command("messages_half_page_down")
        end,
        desc = "scroll messages down",
      },
    },
  },
}
