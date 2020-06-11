" Set Leader key to Space
" Mappings using <leader> are set in ~/.config/nvim/keys/which-key.vim
let mapleader=" "

" Use Ctrl-s to increment number at cursor since we remap C-a below
nnoremap <C-s> <C-a>

" Another way to exit insert mode
" <C-c> is another built-in option in addition to <Esc>
:inoremap kj <esc>

" shortcuts for ctrl-a and ctrl-e in insert/normalcommand mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
nnoremap <C-e> $
nnoremap <C-a> ^
cnoremap <C-e> <End>
cnoremap <C-a> <Home>

" Move by visual lines
nnoremap j gj
nnoremap k gk

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use alt + arrows to resize windows
nnoremap <silent> <M-Down>    :resize -2<CR>
nnoremap <silent> <M-Up>    :resize +2<CR>
nnoremap <silent> <M-Left>    :vertical resize -2<CR>
nnoremap <silent> <M-Right>    :vertical resize +2<CR>

" Alt +kj drag line up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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

" Map <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" <CR> to confirm coc-completion, use:
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"


" Save/write buffer to file
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fw :w<CR>
