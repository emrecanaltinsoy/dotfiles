return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      local opencode_cmd = "opencode --port"
      ---@type snacks.terminal.Opts
      local snacks_terminal_opts = {
        win = {
          position = "right",
          enter = false,
          on_win = function(win)
            -- Set up keymaps and cleanup for an arbitrary terminal
            require("opencode.terminal").setup(win.win)
          end,
        },
      }
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
          end,
          stop = function()
            require("snacks.terminal").get(opencode_cmd, snacks_terminal_opts):close()
          end,
          toggle = function()
            require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
          end,
        },
        port = 33337,
        -- provider = {
        --   enabled = "tmux",
        --   tmux = {
        --     options = "-h",
        --     focus = false,
        --   },
        -- },
      }
      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Override the stop method to kill the pane instead of just the process
      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = "LazyDone",
      --   callback = function()
      --     local provider = require("opencode.config").provider
      --     if provider and provider.name == "tmux" then
      --       provider.stop = function(self)
      --         local pid = self:get_pid()
      --         if self.pane_id and pid then
      --           require("opencode.provider.util").kill(pid)
      --           vim.fn.system("tmux kill-pane -t " .. self.pane_id)
      --           self.pane_id = nil
      --         end
      --       end
      --     end
      --   end,
      -- })

      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ", { submit = true })
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
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })
    end,

    opts = {},
  },
}
