return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      ignored = true,
    },
    dashboard = {
      preset = {
        header = [[
██████   █████ █████   █████ █████ ██████   ██████
▒▒██████ ▒▒███ ▒▒███   ▒▒███ ▒▒███ ▒▒██████ ██████ 
 ▒███▒███ ▒███  ▒███    ▒███  ▒███  ▒███▒█████▒███ 
 ▒███▒▒███▒███  ▒███    ▒███  ▒███  ▒███▒▒███ ▒███ 
 ▒███ ▒▒██████  ▒▒███   ███   ▒███  ▒███ ▒▒▒  ▒███ 
 ▒███  ▒▒█████   ▒▒▒█████▒    ▒███  ▒███      ▒███ 
 █████  ▒▒█████    ▒▒███      █████ █████     █████
▒▒▒▒▒    ▒▒▒▒▒      ▒▒▒      ▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒ 
        ]],
        -- your dashboard configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      -- item field formatters
      formats = {
        icon = function(item)
          if item.file and item.icon == "file" or item.icon == "directory" then
            return Snacks.dashboard.icon(item.file, item.icon)
          end
          return { item.icon, width = 2, hl = "icon" }
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end
          local dir, file = fname:match("^(.*)/(.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },
      sections = {
        { section = "header" },
        -- {
        --   section = "terminal",
        --   cmd = "pokemon-colorscripts -r --no-title; sleep .1",
        --   random = 10,
        --   pane = 2,
        --   indent = 4,
        --   height = 30,
        -- },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
