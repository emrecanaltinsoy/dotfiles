require 'settings'
require 'plugins'
require 'keybindings'

vim.cmd("colo gruvbox")
vim.cmd('au ColorScheme * hi Normal ctermbg=none guibg=none')

require('config.bufferline')
require('config.colorizer')
require('config.dashboard')
require('config.galaxyline')
require('config.gitsign')
require('config.lsp-saga')
require('config.nv-compe')
require('config.nvim-commenter')
require('config.nvim-tree')
require('config.telescope')
require('config.toggle-term')
require('config.treesitter')
require('config.whichkey')

-- require('config.startify')
--require('lsp')
-- require('config.lightbulb')
