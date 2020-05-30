" Comments in Vimscript start with a `"`.

scriptencoding utf-8

" Fish doesn't play all that well with others
" set shell=/bin/bash

" Plugins dealt with in separate file
source ~/.config/nvim/plugins.vim

" Set Leader key to Space
let mapleader=" "

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on
set termguicolors
let base16colorspace=256
set background=dark
colorscheme onedark

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

" shortcuts for ctrl-a and ctrl-e in insert mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
map H ^
map L $

" Move by visual lines
nnoremap j gj
nnoremap k gk

" indentation stuff
set autoindent
set smartindent
set pastetoggle=<F2>

" tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>w <C-w>

" Ctrl+h to stop highlighting search results
vnoremap <C-n> :nohlsearch<cr>
nnoremap <C-n> :nohlsearch<cr>

" Double tab leader key (space bar for me) to start command mode
nnoremap <leader><leader> :
vnoremap <leader><leader> :

" Run :FZF for file selection + preview
set rtp+=/usr/local/opt/fzf

nnoremap <Leader>n :NERDTreeToggle<CR>

" Run FZF command to open file
nnoremap <Leader>F :FZF<CR>

" Run FZF command to open file
nnoremap <Leader>q :q<CR>

" Save/write buffer to file
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fw :w<CR>

" Reload config file
nnoremap <Leader>r :source $MYVIMRC<CR>


