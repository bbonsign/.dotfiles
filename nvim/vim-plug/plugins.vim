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

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ap/vim-css-color'

" Markdown
" Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'joom/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup' " Not all features seem to work
Plug 'dhruvasagar/vim-pairify'
Plug 'tpope/vim-repeat' " Not all features seem to work

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

" Breifly higlight yanked text
Plug 'machakann/vim-highlightedyank'

Plug 'rust-lang/rust.vim'

" Syntax higlighting for Jinga.
" Tries to auto detect
Plug 'mitsuhiko/vim-jinja'

" Automatic table formating, basic spreadsheet, like in org mode
" Plug 'dhruvasagar/vim-table-mode'

" More text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'   " entire buffer: ae, ie
Plug 'kana/vim-textobj-indent'   " common indentation level: ai, ii
Plug 'kana/vim-textobj-line'     " current line w/out EOL character (e.g. as yy does): al, il
Plug 'adriaanzon/vim-textobj-matchit'  " text object deterined by matchit pairs: am, im
Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html attribute key=value: ax, ix
Plug 'jceb/vim-textobj-uri'      " uri/url text object: au, iu & go to open link on linux

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

