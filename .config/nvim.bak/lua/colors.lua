vim.cmd("colo gruvbox")
vim.opt.background="dark"                     -- tell vim what the background color looks like
vim.opt.termguicolors=true
vim.cmd('au ColorScheme * hi Normal ctermbg=none guibg=none')
