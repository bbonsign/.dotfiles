" Set Leader key to Space
" Mappings using <leader> are set in ~/.config/nvim/keys/which-key.vim
let mapleader=" "

" Use Ctrl-s to increment number at cursor since we remap C-a below
nnoremap <C-s> <C-a>

" shortcuts for ctrl-a and ctrl-e in insert/normal mode
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

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Ctrl+h to stop highlighting search results
vnoremap <C-n> :nohlsearch<cr>
nnoremap <C-n> :nohlsearch<cr>

" Double tab leader key (space bar for me) to start command mode
nnoremap <leader><leader> :
vnoremap <leader><leader> :

" Better nav for omnicomplete
" <C-n> and <C-p> still work too
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" Toggle comments in visual mode, from tpope/commentary plugin
" Note that C-_ actually maps to C-/, which is what I want
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>


" Save/write buffer to file
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fw :w<CR>
