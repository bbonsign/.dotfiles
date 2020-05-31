" Set Leader key to Space
let mapleader=" "

" shortcuts for ctrl-a and ctrl-e in insert mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
nnoremap <C-e> $
nnoremap <C-a> ^

" Move by visual lines
nnoremap j gj
nnoremap k gk

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

nnoremap <Leader>n :NERDTreeToggle<CR>

" Run FZF command to open file
nnoremap <Leader>F :FloatermNew fzf<CR>

" Run FZF command to open file
nnoremap <Leader>q :q<CR>

" Save/write buffer to file
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fw :w<CR>

" Reload config file
nnoremap <Leader>r :source $MYVIMRC<CR>

