set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

command! PlugSnap !XZ_OPT=-9 tar cJf ~/.config/nvim/autoload/plugged.tar.xz ~/.config/nvim/autoload/plugged/

"------------------------------------------------------------------------------"
"                                    General                                   "
"------------------------------------------------------------------------------"
lua require'settings'
"source $HOME/.config/nvim/general/functions.vim
"source $HOME/.config/nvim/general/headers.vim
"------------------------------------------------------------------------------"
"                                    Plugins                                   "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/vim-plug/plugins.vim
"------------------------------------------------------------------------------"
"                                 Key Bindings                                 "
"------------------------------------------------------------------------------"
lua require'keybindings'
"------------------------------------------------------------------------------"
"                                Plugin Configs                                "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/rainbow-parentheses.vim
lua require'plug-colorizer'
source $HOME/.config/nvim/plug-config/which-key.vim
"------------------------------------------------------------------------------"
"                           Airline Theme and Plugin                           "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/plug-config/airline.vim
