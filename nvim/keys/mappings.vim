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

" Toggle comments in visual mode, from tpope/commentary plugin
" Note that C-_ actually maps to C-/, which is what I want
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
nnoremap <silent> <C-_> :Commentary<CR>
vnoremap <silent> <C-_> :Commentary<CR>

" Ctrl-p to fuzzy search files in pwd. :Files defined in fzf config
" TODO: make search root the project root
noremap <C-p> :Files<CR>

" shift-y to yank to end of line, like D, C, etc
nnoremap Y y$

" Use <Esc> to go to normal mode in terminal
" Then use Alt-[ to set the escape key to the underlying program in terminal
tnoremap <A-[> <C-\><C-n>
" tnoremap <A-[> <Esc>


" Completion related mappings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" From coc Readme
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Better nav for omnicomplete
" <C-n> and <C-p> still work too
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" Map <C-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" <CR> to confirm coc-completion, use:
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

