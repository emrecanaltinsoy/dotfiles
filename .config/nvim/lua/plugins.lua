local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

-- Automatically compile when this file is saved
-- vim.cmd('autocmd BufWritePost plugins.lua source <afile> | PackerCompile | PackerInstall')

return require('packer').startup(
    function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        
        -- Telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {'nvim-lua/popup.nvim'}, 
                {'nvim-lua/plenary.nvim'},
                {'nvim-telescope/telescope-media-files.nvim'},
            }
        }
        
        -- Treesitter
        use 'nvim-treesitter/nvim-treesitter'
        
        -- Testing
        -- use 'vim-test/vim-test'         -- ???
        
        -- Start screen
        -- Startify
        -- use 'mhinz/vim-startify'
        -- Dashboard
        use 'glepnir/dashboard-nvim'
        
        -- Never forget your keys
        use 'folke/which-key.nvim'
        
        -- Helpers
        use 'jiangmiao/auto-pairs'
        use 'junegunn/rainbow_parentheses.vim'
        use 'norcalli/nvim-colorizer.lua'
        -- use 'kosayoda/nvim-lightbulb'     -- ???
        
        -- LSP
        use 'glepnir/lspsaga.nvim'
        use 'neovim/nvim-lspconfig'
        use 'kabouzeid/nvim-lspinstall'
        
        -- Auto complete
        use 'hrsh7th/nvim-compe'
        use 'hrsh7th/vim-vsnip'
        
        -- Git extension
        use {
            'lewis6991/gitsigns.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            }
        }
        -- use 'tpope/vim-fugitive'
        
        -- Floaterm
        use {"akinsho/nvim-toggleterm.lua"}
        
        -- Nvim Tree
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons'
            }
        }
        
        -- Galaxyline
        use {
            'glepnir/galaxyline.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons'
            }
        }
        -- Bufferline
        use {
            'akinsho/nvim-bufferline.lua', 
            requires = {
                'kyazdani42/nvim-web-devicons'
            }
        }
        
        -- Commentor
        use 'terrortylor/nvim-comment'
        
        -- Themes
        -- use 'joshdick/onedark.vim'
        use 'morhetz/gruvbox'
        use 'phanviet/vim-monokai-pro'
        -- use 'dracula/vim'
    end
)
