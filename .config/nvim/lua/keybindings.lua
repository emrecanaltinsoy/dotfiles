-- Setting the <Leader> key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap=true, silent=true })
vim.g.mapleader = ' '

-- Skipping default commentframe keymappings
vim.g.CommentFrame_SkipDefaultMappings = true

vim.g.NERDCreateDefaultMappings = 0

-- Window Resizing <M-j> is <Alt-j>
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize -2<CR>', { noremap=true, silent=true })

--ESC Alternatives
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap=true, silent=true })

-- Better window navigation 
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap=true, silent=true })

-- Next line is not a command line
vim.api.nvim_set_keymap('n', 'o', 'o<ESC>0D', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', 'O', 'O<ESC>0D', { noremap=true, silent=true })

-- Better tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap=true, silent=true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap=true, silent=true })

--Alternate way to save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', '<C-s>', ':w<CR>', { noremap=true, silent=true })

--Alternative way to quit
vim.api.nvim_set_keymap('n', '<C-Q>', ':wq<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', '<C-Q>', ':wq<CR>', { noremap=true, silent=true })

--TAB in general mode will move to text buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap=true, silent=true })
--SHIFT-TAB will go back
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap=true, silent=true })

--Easy CAPS
vim.api.nvim_set_keymap('i', '<C-u>', '<ESC>viwUi', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-u>', 'viwU<ESC>', { noremap=true, silent=true })

--Better nav for omnicomplete
vim.api.nvim_set_keymap('i', '<C-j>', '<C-n>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-p>', { noremap=true, silent=true })

--Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap('i', "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap=true, silent=true })

--Navigation (Insert Mode)
vim.api.nvim_set_keymap('i', "<a-up>", "<c-\\><c-n><c-w>ki", { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', "<a-down>", "<c-\\><c-n><c-w>ji", { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', "<a-left>", "<c-\\><c-n><c-w>hi", { noremap=true, silent=true })
vim.api.nvim_set_keymap('i', "<a-right>", "<c-\\><c-n><c-w>li", { noremap=true, silent=true })

