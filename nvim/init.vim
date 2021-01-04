"  _       _ _         _
" (_)     (_) |       (_)
"  _ _ __  _| |___   ___ _ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" Fish doesn't play all that well with others
" set shell=/bin/bash

" Plugins loaded in separate file
source ~/.config/nvim/vim-plug/plugins.vim

" General personal settings/mappings
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/keys/mappings.vim
source ~/.config/nvim/keys/which-key.vim
source ~/.config/nvim/plugins.vim

" Set theme
source ~/.config/nvim/themes/onedark.vim
source ~/.config/nvim/themes/airline.vim

" Source plugin configurations
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/floaterm.vim
source ~/.config/nvim/plug-config/quickscope.vim
source ~/.config/nvim/plug-config/sneak.vim
source ~/.config/nvim/plug-config/startify.vim
source ~/.config/nvim/plug-config/nerdtree.vim

