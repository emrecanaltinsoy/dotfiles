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

-- Better window navigation 
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap=true, silent=true })

