" Comments in Vimscript start with a `"`.

scriptencoding utf-8

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Copy/paste between vim and everything else
set clipboard=unnamedplus

" Turn on syntax highlighting.
"syntax on
"set termguicolors
"let base16colorspace=256
"set background=dark
"colorscheme onedark

" Allow persistent undo history
set undofile

" Show line numbers.
set number

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support.
set mouse+=a

" indentation stuff
set smartindent
set autoindent

" tabs and spaces
set tabstop=2     " Insert 2 spaces for tab
set shiftwidth=2  " Change number of space characters inserted for indentation
set smarttab      " Make tabbing realize when 2 vs 4
set expandtab     " Converts tabs to spaces

" Horizaontal splits below, vertical to the right
set splitbelow
set splitright

" Run :FZF for file selection + preview
set rtp+=/usr/local/opt/fzf

" Recommended by coc
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience. Also from coc
set updatetime=300
