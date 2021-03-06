" Set Leader key to Space
" Mappings using <leader> are set in ~/.config/nvim/keys/which-key.vim
let mapleader=" "
let maplocalleader="\\"

" Easily enter command mode (no shift button!)
" Swapped ; and : globally with Karabiner-Elements
" nnoremap ; :
" vnoremap ; :

" The above messes up useing ';' for the next "f search"
" Enter and Backspace are used in nvim/plug-config/sneak.vim
" so the f-versions have an 'f' prefix.  This allows for vim-sneak and the
" normal f & t searching to be used
nnoremap f<CR> ;
nnoremap f<BS> ,
vnoremap f<CR> ;
vnoremap f<BS> ,

" Enter command window from noraml mode
" note: enter command window with Ctrl-F when already at cmd line
nnoremap q; q:
vnoremap q; q:

" Use Ctrl-s to increment number at cursor since we remap C-a below
nnoremap <C-s> <C-a>

" Another way to exit insert mode
" <C-c> and <C-[> are other ways to exit insert mode
" inoremap kj <Esc> -- remapped differently below, I dont use this much

" Insert new line with correct indentation when cursor is on closing empty
" delimiters, E.g. {} -> {
"
"                      }
inoremap kj <Esc>i<CR><Esc>O
nnoremap <leader>z i<CR><Esc>O

" Let's write some λ's!!!
inoremap <C-\> λ

" Override s from vim-sneak to ys for vis-surround
" vim-sneak isn't as usedul with easymotion installed
nmap s ys

" UndoTree
nnoremap <leader>u :UndotreeToggle<CR>

" shortcuts for ctrl-a and ctrl-e in insert/normalcommand mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
nnoremap <C-e> $
nnoremap <C-a> ^
vnoremap <C-e> g_
vnoremap <C-a> ^
cnoremap <C-e> <End>
cnoremap <C-a> <Home>

" Since ctrl-e is overwritten, use ctrl-h instead
" ctrl-e scrolls up a line, ctrl-y down a line
nnoremap <C-h> <C-e>
vnoremap <C-h> <C-e>

" Move by visual lines
nnoremap j gj
nnoremap k gk

" " Consistent switching between vim/tmux splits
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
" nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
" nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
" " nnoremap <silent> <C-w>w :TmuxNavigatePrevious<cr>
" nnoremap <silent> <C-w><C-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-w><C-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-w><C-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-w><C-l> :TmuxNavigateRight<cr>
" " nnoremap <silent> <C-w><C-w> :TmuxNavigatePrevious<cr>
" " Disable tmux navigator when zooming the Vim pane
" let g:tmux_navigator_disable_when_zoomed = 1

" Use alt + arrows to resize windows
nnoremap <silent> <M-Down> :resize -2<CR>
nnoremap <silent> <M-Up> :resize +2<CR>
nnoremap <silent> <M-Left> :vertical resize -2<CR>
nnoremap <silent> <M-Right> :vertical resize +2<CR>

" Alt +kj drag line up/down
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv


" Ctrl+h to stop highlighting search results
" vnoremap <silent> <C-n> :nohlsearch<CR>
" nnoremap <silent> <C-n> :nohlsearch<CR>
" inoremap <silent> <C-n> <Esc>:nohlsearch<CR>a
vnoremap <silent> <leader>n :nohlsearch<CR>
nnoremap <silent> <leader>n :nohlsearch<CR>

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

" Shortcut for C-x C-l line completion
inoremap <C-l> <C-x><C-l>
nnoremap <C-l> i<C-x><C-l>

" FZF mode completion in insert mode
" Since C-x is my tmux prefix, line completion really needs C-x C-x C-l
imap <c-w> <plug>(fzf-complete-word)
imap <expr> <c-f> fzf#vim#complete#path('fd')
imap <c-l> <plug>(fzf-complete-line)

" Open a fuzzy finder based on the current completion options
function! PInsert2(item)
  let @z=a:item
  norm "zp
  call feedkeys('a')
endfunction

function! CompleteInf()
  let nl=[]
  let l=complete_info()
  for k in l['items']
    call add(nl, k['word']. ' : ' .k['info'] . ' '. k['menu'] )
  endfor
  call fzf#vim#complete(fzf#wrap({ 'source': nl,
    \ 'reducer': { lines -> split(lines[0], '\zs :')[0] },
    \ 'sink':function('PInsert2')}))
endfunction

imap <space><tab>  <CMD>:call CompleteInf()<CR>
" =================================================

" Use <Esc> to go to normal mode in terminal
" Then use Alt-[ to set the escape key to the underlying program in terminal
tnoremap <A-[> <C-\><C-n>
tnoremap <C-]> <C-\><C-n>

" Fake css property text object
" TODO: Look into creating one for real with vim-textobj-user plugin
" the leading 'h' makes it work when the cursor is on the ';'
onoremap <silent> a; :<C-U>normal! hf;F:Bvf;<CR>
onoremap <silent> i; :<C-U>normal! hf;F:Bvt;<CR>
xnoremap <silent> a; :<C-U>normal! hf;F:Bvf;<CR>
xnoremap <silent> i; :<C-U>normal! hf;F:Bvt;<CR>


" Use the blackhole register "_ by default for x
nnoremap x "_x
vnoremap x "_x
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" Use <space> prefix for default behavior (deleted text -> default register)
nnoremap <space>d d
vnoremap <space>d d
nnoremap <space>D D
vnoremap <space>D D
nnoremap <space>c c
vnoremap <space>c c
nnoremap <space>C C
vnoremap <space>C C


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
" C-j isn't working
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" Map <C-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" <CR> to confirm coc-completion, use:
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<cr>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
