require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)                       -- 20 | 
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '2', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',        -- 'vertical' | 'horizontal' | 'window' | 'float'
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',         -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    width = 150,
    height = 45,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
    cmd = "lazygit", 
    hidden = false, 
    direction = 'float',
    shading_factor = '2',
    close_on_exit = true,
})

function _lazygit_toggle()
  lazygit:toggle()
end

local lazydocker = Terminal:new({ 
    cmd = "lazydocker", 
    hidden = false, 
    direction = 'float',
    shading_factor = '2',
    close_on_exit = true,
})

function _lazydocker_toggle()
  lazydocker:toggle()
end

-- local wk = require("which-key")
-- 
-- opt = {
--     mode = "n", -- NORMAL mode
--     prefix = "<leader>",
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = true, -- use `nowait` when creating keymaps
-- }
-- 
-- keys = {
--     t = {
--         name = "Packer",
--         g = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
--         d = { "<cmd>lua _lazydocker_toggle()<CR>", "Lazydocker" },
--     }
-- }

-- wk.register(keys, opt)

-- vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua _lazyt_toggle()<CR>", {noremap = true, silent = true})
