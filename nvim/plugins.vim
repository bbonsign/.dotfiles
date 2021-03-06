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

Plug 'guns/vim-sexp'

Plug 'terryma/vim-expand-region'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'
" Plug 'kyazdani42/nvim-web-devicons'  " In Lua, better alternative later?

Plug 'ntpeters/vim-better-whitespace'

Plug 'junegunn/rainbow_parentheses.vim'

" Plug 'ap/vim-css-color'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'mbbill/undotree'

" For consitent tmux/vim pane switching
Plug 'christoomey/vim-tmux-navigator'

" Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Emmet: Expand html from keywords
Plug 'mattn/emmet-vim'

" Conceal anon functions with 𝝺
" Plug 'calebsmith/vim-lambdify'

" OPen files w/ cursor at line:column position
Plug 'wsdjeg/vim-fetch'

Plug 'Olical/conjure', {'tag': 'v4.9.0'}
Plug 'Olical/aniseed', { 'tag': 'v3.11.0' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-rooter'

Plug 'joom/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup' " Not all features seem to work
Plug 'dhruvasagar/vim-pairify'
Plug 'tpope/vim-repeat' " Not all features seem to work

Plug 'glts/vim-radical'

Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

" Search by two characters
Plug 'justinmk/vim-sneak'

" Improved f/t (highlights etc)
" Disabled b/c vim-sneak provides it's own version of f,t, and using those
" means consistent keys for next match
Plug 'unblevable/quick-scope'

" Possibly replace quick-scope with:
" Plug 'rhysd/clever-f.vim'

Plug 'liuchengxu/vim-which-key'

Plug 'joshdick/onedark.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" I can't get the following to work yet, but might be a good alternative
" Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Extend  " and @ to preview registers in normal mode
Plug 'junegunn/vim-peekaboo'

" For Haskell: fzf hoogle results
Plug 'monkoose/fzf-hoogle.vim'

" Terminal - floating windows for fzf, etc.
Plug 'voldikss/vim-floaterm'

" Send commands to repl in other tmux split
Plug 'jpalardy/vim-slime'

" Start Screen
Plug 'mhinz/vim-startify'

" Breifly higlight yanked text
Plug 'machakann/vim-highlightedyank'

" Align to character easily, e.g. add spaces to make '='
" on the same column in several lines of assignments
" use gl or gL + motion + character to align by
" https://github.com/tommcdo/vim-lion
Plug 'tommcdo/vim-lion'

" Show tags in a side bar
Plug 'majutsushi/tagbar'
" Plug 'liuchengxu/vista.vim'

" Syntax higlighting for Jinga.
" Tries to auto detect
Plug 'mitsuhiko/vim-jinja'

" Automatic table formating, basic spreadsheet, like in org mode
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'jceb/vim-orgmode'

" Improved pair & quotes text objects + arguments and separators
Plug 'wellle/targets.vim'

" More text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'   " entire buffer: ae, ie
Plug 'kana/vim-textobj-indent'   " common indentation level: ai, ii
" Plug 'kana/vim-textobj-line'     " current line w/out EOL character (e.g. as yy does): al, il
Plug 'adriaanzon/vim-textobj-matchit'  " text object deterined by matchit pairs: am, im
Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html attribute key=value: ax, ix
Plug 'jceb/vim-textobj-uri'      " uri/url text object: au, iu & go to open link on linux

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

