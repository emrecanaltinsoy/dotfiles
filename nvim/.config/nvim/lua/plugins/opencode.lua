return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      local opencode_cmd = "opencode --port"

      local server
      ---@type snacks.terminal.Opts
      local snacks_opts = {
        win = {
          position = "right",
          enter = false,
        },
      }
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, snacks_opts)
        end,
      }

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = server,
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask opencode" })

      vim.keymap.set({ "n", "x" }, "<leader>ox", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })

      vim.keymap.set({ "n", "x" }, "<leader>op", function()
        require("opencode").prompt("@this")
      end, { desc = "Add to opencode" })

      vim.keymap.set("n", "<leader>on", function()
        require("opencode").command("session.new")
      end, { desc = "New session" })

      vim.keymap.set("n", "<leader>oi", function()
        require("opencode").command("session.interrupt")
      end, { desc = "Interrupt session" })

      vim.keymap.set({ "n", "t" }, "<leader>oT", function()
        require("snacks.terminal").toggle(opencode_cmd, snacks_opts)
      end, { desc = "Toggle opencode" })
    end,

    opts = {},
  },
}
