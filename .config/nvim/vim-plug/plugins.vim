"------------------------------------------------------------------------------"
"                             Auto Install vim-plug                            "
"------------------------------------------------------------------------------"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"------------------------------------------------------------------------------"
"                                   Plugings                                   "
"------------------------------------------------------------------------------"
call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support 
    Plug 'sheerun/vim-polyglot' 
    " File Manager at the startup
    Plug 'mhinz/vim-startify'    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Rainbow Parentheses
  	Plug 'junegunn/rainbow_parentheses.vim'
    " Vim Rainbow Colors
    Plug 'frazrepo/vim-rainbow'
    " Display colors on hex codes
    Plug 'norcalli/nvim-colorizer.lua'
    " Creates comment frames
    Plug 'cometsong/CommentFrame.vim'
    " Helps with comment shortcut (Space+/)
    Plug 'tpope/vim-commentary'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Python highlighting
    Plug 'vim-python/python-syntax'          
    " Lightline statusbar
    Plug 'itchyny/lightline.vim'              
    " Which-key
    Plug 'liuchengxu/vim-which-key'
    " Multiple Cursor
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"------------------------------------------------------------------------------"
"                               Ranger Extension                               "
"------------------------------------------------------------------------------"
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}    

"------------------------------------------------------------------------------"
"                               Airline Extension                              "
"------------------------------------------------------------------------------"
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Lightline extension
    " Plug 'mengelbrecht/lightline-bufferline'
"------------------------------------------------------------------------------"
"                           NERDTree (File Explorer)                           "
"------------------------------------------------------------------------------"
    Plug 'scrooloose/NERDTree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'

"------------------------------------------------------------------------------"
"                                 Fuzzy Finder                                 "
"------------------------------------------------------------------------------"
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

"------------------------------------------------------------------------------"
"                                Git Integration                               "
"------------------------------------------------------------------------------"
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

"------------------------------------------------------------------------------"
"                                    Themes                                    "
"------------------------------------------------------------------------------"
    Plug 'joshdick/onedark.vim'
call plug#end()

"------------------------------------------------------------------------------"
"                         Auto Install Plugins On Start                        "
"------------------------------------------------------------------------------"
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


