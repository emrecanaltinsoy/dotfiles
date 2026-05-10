return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      local opencode_cmd = "opencode --port 33337"
      local in_tmux = vim.env.TMUX ~= nil

      local server
      if in_tmux then
        local pane_id = nil
        server = {
          start = function()
            local result = vim.fn.system("tmux split-window -dh -P -F '#{pane_id}' " .. opencode_cmd)
            pane_id = vim.trim(result)
          end,
          stop = function()
            if pane_id then
              vim.fn.system("tmux kill-pane -t " .. pane_id)
              pane_id = nil
            end
          end,
          toggle = function()
            local panes = vim.fn.system("tmux list-panes -a -F '#{pane_id}'")
            if pane_id and panes:find(pane_id, 1, true) then
              vim.fn.system("tmux kill-pane -t " .. pane_id)
              pane_id = nil
            else
              local result = vim.fn.system("tmux split-window -dh -P -F '#{pane_id}' " .. opencode_cmd)
              pane_id = vim.trim(result)
            end
          end,
        }
      else
        ---@type snacks.terminal.Opts
        local snacks_opts = {
          win = {
            position = "right",
            enter = false,
            on_win = function(win)
              require("opencode.terminal").setup(win.win)
            end,
          },
        }
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, snacks_opts)
          end,
          stop = function()
            require("snacks.terminal").get(opencode_cmd, snacks_opts):close()
          end,
          toggle = function()
            require("snacks.terminal").toggle(opencode_cmd, snacks_opts)
          end,
        }
      end

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = server,
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

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
