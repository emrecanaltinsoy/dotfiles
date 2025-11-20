local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.setup({
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        command = { "zsh" },
      },
      python = {
        command = { "uv", "run", "--with", "ipython", "ipython", "--no-autoindent" },
        -- command = { "python3" }, -- or { "ipython", "--no-autoindent" }
        format = common.bracketed_paste_python,
        block_dividers = { "# %%", "#%%" },
        env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
      },
    },
    -- set the file type of the newly created repl to ft
    -- bufnr is the buffer id of the REPL and ft is the filetype of the
    -- language being used for the REPL.
    repl_filetype = function(bufnr, ft)
      return ft
    end,
    -- Send selections to the DAP repl if an nvim-dap session is running.
    -- dap_integration = true,
    repl_open_cmd = view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    toggle_repl = "<space>rr", -- toggles the repl open and closed.
    restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
    send_motion = "<space>rc",
    visual_send = "<space>rc",
    send_file = "<space>rf",
    send_line = "<space>rl",
    send_paragraph = "<space>rp",
    send_until_cursor = "<space>ru",
    -- send_mark = "<space>rm",
    send_code_block = "<space>rb",
    send_code_block_and_move = "<space>rn",
    -- mark_motion = "<space>rmc",
    -- mark_visual = "<space>rmc",
    -- remove_mark = "<space>rmd",
    cr = "<space>r<cr>",
    interrupt = "<space>r<space>",
    exit = "<space>rq",
    clear = "<space>rl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true,
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
})

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
