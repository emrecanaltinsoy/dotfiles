set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

command! PlugSnap !XZ_OPT=-9 tar cJf ~/.config/nvim/autoload/plugged.tar.xz ~/.config/nvim/autoload/plugged/

"------------------------------------------------------------------------------"
"                                    General                                   "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/colors.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/general/headers.vim
"------------------------------------------------------------------------------"
"                                    Plugins                                   "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/vim-plug/plugins.vim
"------------------------------------------------------------------------------"
"                                 Key Bindings                                 "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/keys/mappings.vim
"------------------------------------------------------------------------------"
"                                Plugin Configs                                "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/rainbow-parentheses.vim
source $HOME/.config/nvim/plug-config/colorizer.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/nerdtree-git.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/which-key.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
"------------------------------------------------------------------------------"
"                           Airline Theme and Plugin                           "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/plug-config/airline.vim
