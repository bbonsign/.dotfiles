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


Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'

" Mappings for g* and z*
Plug 'haya14busa/vim-asterisk'

" Plug 'ryanoasis/vim-devicons'

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
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Emmet: Expand html from keywords
Plug 'mattn/emmet-vim', {'for': ['html', 'jinja', 'jinja2', 'htmljinja', 'htmldjango', 'vue', 'jsx', 'javascriptreact' ]}

" Conceal anon functions with 𝝺
" Plug 'calebsmith/vim-lambdify'

" Open files w/ cursor at line:column position
Plug 'wsdjeg/vim-fetch'

Plug 'Olical/conjure'
Plug 'Olical/nvim-local-fennel'
Plug 'Olical/aniseed'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-rooter'
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'

Plug 'joom/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup' " Not all features seem to work
Plug 'dhruvasagar/vim-pairify'
Plug 'tpope/vim-repeat' " Not all features seem to work

Plug 'glts/vim-radical'

Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

" Improved f/t (highlights etc)
Plug 'unblevable/quick-scope'

" Possibly replace quick-scope with:
" Plug 'rhysd/clever-f.vim'

Plug 'folke/which-key.nvim'

Plug 'joshdick/onedark.vim'
Plug 'glepnir/zephyr-nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'projekt0n/github-nvim-theme'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'nvim-lualine/lualine.nvim'

Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Extend " and @ to preview registers in normal mode
Plug 'junegunn/vim-peekaboo'

" For Haskell: fzf hoogle results
" Plug 'monkoose/fzf-hoogle.vim'

" Terminal - floating windows for fzf, etc.
Plug 'voldikss/vim-floaterm'

" Better buffer deletion defaults
Plug 'ojroques/nvim-bufdel'

" Start Screen
" Plug 'mhinz/vim-startify'

" Breifly higlight yanked text
Plug 'machakann/vim-highlightedyank'

" Dim unfocused windows
" Plug 'blueyed/vim-diminactive'

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
Plug 'mitsuhiko/vim-jinja', {'for': ['jinja', 'jinja2', 'htmljinja', 'html']}

" For tmux config files: hl, run commands w/ g!, man mage with K
Plug 'tmux-plugins/vim-tmux'

" Automatic table formating, basic spreadsheet, like in org mode
" Plug 'dhruvasagar/vim-table-mode'

" Improved pair & quotes text objects + arguments and separators
Plug 'wellle/targets.vim'

Plug 'vim-test/vim-test'

" More text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'   " entire buffer: ae, ie
Plug 'kana/vim-textobj-indent'   " common indentation level: ai, ii
Plug 'kana/vim-textobj-line'     " current line w/out EOL character (e.g. as yy does): al, il
Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html attribute key=value: ax, ix
Plug 'jceb/vim-textobj-uri'      " uri/url text object: au, iu & go to open link on linux
Plug 'Julian/vim-textobj-variable-segment' "for internal word changes in camelCase, kebab-case, snake_case: av, iv
Plug 'RRethy/nvim-treesitter-textsubjects' " like expand-region, but using tree-sitter, ,/. to go down/up

" For toggling between single and multiline forms in language specific ways
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/sideways.vim'

" Toggles maximized windows
Plug 'szw/vim-maximizer'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground' , {'do': ':TSInstall query'}
Plug 'windwp/nvim-ts-autotag'

Plug 'glepnir/dashboard-nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'

Plug 'euclidianAce/BetterLua.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Debugging
" Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

