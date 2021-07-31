local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

local options = { noremap=true, silent=true }

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Setting the <Leader> key
g.mapleader = ' '

-- Skipping default commentframe keymappings
g.CommentFrame_SkipDefaultMappings = true
-- Skipping default NERDCommenter keymappings
g.NERDCreateDefaultMappings = 0

-- Back to view mode on terminal
map('t', '<ESC>', '<C-\\><C-n>', options)

-- Window Resizing <M-j> is <Alt-j>
map('n', '<M-j>', ':resize -2<CR>', options)
map('n', '<M-k>', ':resize +2<CR>', options)
map('n', '<M-h>', ':vertical resize +2<CR>', options)
map('n', '<M-l>', ':vertical resize -2<CR>', options)

--ESC Alternatives
map('i', 'jk', '<ESC>', options)
map('i', 'kj', '<ESC>', options)
map('i', '<C-c>', '<ESC>', options)

-- Better window navigation 
map('n', '<C-h>', '<C-w>h', options)
map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)

-- Next line is not a command line
map('n', 'o', 'o<ESC>0D', options)
map('n', 'O', 'O<ESC>0D', options)

-- Better tabbing
map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

--Alternate way to save
map('n', '<C-s>', ':w<CR>', options)
map('i', '<C-s>', '<ESC>:w<CR>li', options)

--TAB in general mode will move to text buffer
map('n', '<TAB>', ':BufferLineCycleNext<CR>', options)
--SHIFT-TAB will go back
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', options)

--Easy CAPS
map('i', '<C-u>', '<ESC>viwUi', options)
map('n', '<C-u>', 'viwU<ESC>', options)

--Better nav for omnicomplete
map('i', '<C-j>', '<C-n>', options)
map('i', '<C-k>', '<C-p>', options)

--Move current line / block with Alt-j/k ala vscode.
map('i', "<A-j>", "<Esc>:m .+1<CR>==gi", options)
map('i', "<A-k>", "<Esc>:m .-2<CR>==gi", options)

--Navigation Between Split Screens (Insert Mode)
map('i', "<A-Up>", "<c-\\><c-n><c-w>ki", options)
map('i', "<A-Down>", "<c-\\><c-n><c-w>ji", options)
map('i', "<A-Left>", "<c-\\><c-n><c-w>hi", options)
map('i', "<A-Right>", "<c-\\><c-n><c-w>li", options)

