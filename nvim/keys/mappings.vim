" Set Leader key to Space
" Mappings using <leader> are set in ~/.config/nvim/keys/which-key.vim
let mapleader=" "
let maplocalleader="\\"

" The above messes up useing ';' for the next "f search"
" Enter and Backspace are used in nvim/plug-config/sneak.vim
" so the f-versions have an 'f' prefix.  This allows for vim-sneak and the
" normal f & t searching to be used
" nnoremap <CR> ;
" nnoremap <BS> ,

" highlight the visual selection after pressing enter.
xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>

" Enter command window from noraml mode
" note: enter command window with Ctrl-F when already at cmd line
nnoremap g: q:
vnoremap g: q:
nnoremap q: <nop>
vnoremap q: <nop>

" Mostly to avoid annoying message about how to exit
vnoremap <C-c> <nop>

" Run macro in the "q register with Q, inc over a visual selection
nnoremap Q @q
vnoremap Q :norm @q<cr>

" quickfix conveniences
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" Keep selected region when indenting repeatedly
vnoremap > >gv
vnoremap < <gv

" Use Ctrl-s to increment number at cursor since we remap C-a below
nnoremap <C-s> <C-a>

nnoremap <C-c> :nohlsearch<CR>

" Insert new line with correct indentation when cursor is on closing empty
" delimiters, E.g. {} -> {
"
"                      }
" inoremap kj <Esc>i<CR><Esc>O
" nnoremap <leader>z i<CR><Esc>O

" Let's write some λ's!!!
inoremap <C-\> λ

" Override s to ys for vim-surround
nmap s ys
vmap s S

" UndoTree
nnoremap <leader>U :UndotreeToggle<CR>

" shortcuts for ctrl-a and ctrl-e in insert/normalcommand mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
nnoremap <C-e> $
nnoremap <C-a> ^
vnoremap <C-e> g_
vnoremap <C-a> ^
cnoremap <C-e> <End>
cnoremap <C-a> <Home>

inoremap <C-u> <Esc>ld0i
inoremap <C-w> <Esc>ldbi

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

" Use shift + arrows to resize windows
nnoremap <silent> <A-Down> :resize -2<CR>
nnoremap <silent> <A-Up> :resize +2<CR>
nnoremap <silent> <A-Left> :vertical resize -2<CR>
nnoremap <silent> <A-Right> :vertical resize +2<CR>

" Alt+{k,j} drag line up/down
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

" Add blank lines. Accepts a count.
nnoremap [<space> O<Esc>
" nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>`[j
" nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>j
nnoremap ]<space> o<Esc>

" Toggle comments in visual mode, from tpope/commentary plugin
" Note that C-_ actually maps to C-/, which is what I want
" https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
nnoremap <silent> <C-_> :Commentary<CR>
vnoremap <silent> <C-_> :Commentary<CR>

" Ctrl-p to fuzzy search files in pwd. :Files defined in fzf config
noremap <C-p> :Files<CR>

" shift-y to yank to end of line, like D, C, etc
nnoremap Y y$

" FZF mode completion in insert mode
" Since C-x is my tmux prefix, line completion really needs C-x C-x C-l
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
imap <c-x><c-l> <plug>(fzf-complete-line)

" Open a fuzzy finder based on the current completion options
function! PInsert2(item)
  let @z=a:item
  norm "zp
  call feedkeys('a')
endfunction


" Use the blackhole register "_ by deiault for x
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

" Center line when jumping to search results
nnoremap n nzz
nnoremap N Nzz

" vim-gitgutter provides a hunk text-object accessible with `ih` and `ah`
" This changes it to `ih` and `ah` as well as `ig` and `ag`
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

omap ig <Plug>(GitGutterTextObjectInnerPending)
omap ag <Plug>(GitGutterTextObjectOuterPending)
xmap ig <Plug>(GitGutterTextObjectInnerVisual)
xmap ag <Plug>(GitGutterTextObjectOuterVisual)
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

" Redefine default keybinds for line text object (the l conflicts with
" targets.vim)
let g:textobj_line_no_default_key_mappings = 1
omap i. <Plug>(textobj-line-i)
omap a. <Plug>(textobj-line-a)
xmap i. <Plug>(textobj-line-i)
xmap a. <Plug>(textobj-line-a)

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


" <CR> to confirm coc-completion, use:
" inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<cr>"

" Arrow keys search through history based on current token, but C-n/p
" don't be default.  This gives the same behavior to both
cnoremap <expr> <c-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <c-p> wildmenumode() ? "\<c-p>" : "\<up>"

" Fugitive Conflict Resolution
" nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
