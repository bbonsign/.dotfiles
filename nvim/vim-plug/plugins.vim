" Plugings with vim-plug: https://github.com/junegunn/vim-plug
" See the README for example import options
" Automatically install vim-plug manager if it isn't yet
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ap/vim-css-color'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'joom/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup' " Not all features seem to work

Plug 'glts/vim-radical'

Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'

Plug 'liuchengxu/vim-which-key'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf.vim'

" Terminal - floating winots for fzf, etc.
Plug 'voldikss/vim-floaterm'

" Start Screen
Plug 'mhinz/vim-startify'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Highlight trailing whitespace; remove it on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

