" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=300


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Define this command separately so that the <leader>h doesn't run
" help as a command and bring up the help home page. Instead,
" this will allow me to enter a search term
" Trailing space means the prompt is ready for a new argument
nnoremap <leader>hh :help<space>
vnoremap <leader>hh :help<space>

nnoremap <leader>hm :Man<space>
vnoremap <leader>hm :Man<space>

" Another way to access registers easily
nnoremap <leader>r "
vnoremap <leader>r "

nnoremap <leader>R :registers<CR>
vnoremap <leader>R :registers<CR>

" Another way to jump to marks
nnoremap <leader>j '
vnoremap <leader>j '

" <leader>p or <leader>i append/insert single character at cursor, but stay in
" If no character is chosen before going back to normal mode, a space is left.
" normal mode (<leader>a is shadowed by actions below, hence the p).
nnoremap \ a<Space><Esc>r
nnoremap <leader>i i<Space><Esc>r
nnoremap <leader>p a<Space><Esc>r

" Alternative to Ctrl+/ for commenting lines
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" Single mappings
let g:which_key_map['!'] = [':.!bash'                , 'send line to bash']
" let g:which_key_map['/'] = [':Commentary'            , 'comment']
let g:which_key_map['/'] = 'comment'
let g:which_key_map[';'] = [':Commands'              , 'commands']
let g:which_key_map['='] = ['z='                     , 'correct spelling']
let g:which_key_map[','] = ['Buffers'                , 'fzf-buffer']
let g:which_key_map['d'] = ['%'                      , '%']
let g:which_key_map['e'] = [':CocCommand explorer'   , 'explorer']
let g:which_key_map['F'] = [':Files'                 , 'search files']
let g:which_key_map['i'] = 'insert character'
let g:which_key_map['j'] = 'jump to mark'
" let g:which_key_map['M'] = 'man pages'
let g:which_key_map['m'] = ['%'                      , '%match']
let g:which_key_map['n'] = 'nohlsearch'
let g:which_key_map['p'] = 'append character'
let g:which_key_map['q'] = ['q'                      , 'quit']
let g:which_key_map['r'] = 'access register'
let g:which_key_map['R'] = 'registers'
let g:which_key_map['T'] = [':Rg'                    , 'search text']
let g:which_key_map['W'] = ['w'                      , 'write']
let g:which_key_map['X'] = ['ciw \<Esc>'             , 'trim to one space between words']
let g:which_key_map['x'] = [':StripWhitespace'       , 'strip whitespace']


" Group mappings
let g:which_key_map['.'] = {
      \ 'name' : '+vimrc' ,
      \ '.' : [ ':e $MYVIMRC'                , 'open init' ],
      \ 'r' : [ ':source $MYVIMRC'           , 'reload config' ],
      \ 'h' : [ 'Startify'                   , 'start screen' ],
      \ 'S' : [ ':SSave'                     , 'save session' ],
      \ }


nnoremap <leader>aa A_<Esc>r
" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'a' : 'append char to line',
      \ 'C' : [':Colors'                 , 'color scheme'],
      \ 'c' : [':set cursorline!'        , 'toggle line hi-light'],
      \ 'e' : [':CocCommand explorer'    , 'explorer'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 's' : [':let @/ = ""'            , 'remove search highlight'],
      \ 'S' : [':setlocal spell!'        , 'toggle spelling in buffer' ],
      \ 't' : [':FloatermToggle'         , 'terminal'],
      \ 'v' : [':TagbarToggle'           , 'tag viewer'],
      \ }


" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : ['Buffers'   , 'fzf-buffer'],
      \ 'd' : ['bd'        , 'delete-buffer'],
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'h' : ['Startify'  , 'home-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 's' : ['Scratch()' , 'scratch buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ }


nnoremap <leader>fe :e<Space>

" f is for file
let g:which_key_map.f = {
      \ 'name' : '+file' ,
      \ 'e' : 'edit file',
      \ 'f' : [':Files'           , 'search files'],
      \ 'r' : [':earlier 1f'      , 'revert to last write'],
      \ 's' : [':w'               , 'write file'],
      \ 'w' : [':w'               , 'write file'],
      \ }

"
" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add %'                        , 'add current'],
      \ 'A' : [':Git add .'                        , 'add all'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'G' : [':GGrep'                            , 'git grep'],
      \ 'g' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" h is for help
let g:which_key_map.h = {
      \ 'name' : '+help' ,
      \ 'g' : [':help g'                , 'g commands'],
      \ 't' : [':Helptags'              , 'fzf helptags'],
      \ 'z' : [':help z'                , 'z commands'],
      \ }


nnoremap <leader>l; A;<Esc>

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : 'append ;',
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'g' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'v' : [':TagbarToggle'                       , 'tag viewer'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

" Group mappings
let g:which_key_map.o = {
      \ 'name' : '+open line' ,
      \ 'a' : ['o\<Esc>kO\<Esc>j^'        , 'open two lines'],
      \ 'b' : ['o\<Esc>k^'                , 'open line below'],
      \ 'o' : ['O\<Esc>j^'                , 'open line above'],
      \ 's' : ['o\<Esc>kO\<Esc>j^'        , 'open two lines'],
      \ }

" Shortcut for starting a search+replace command in whole buffer & in line
nnoremap <leader>s% :%s/
nnoremap <leader>s. :.s/

" S is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '%' : 'search+replace in file',
      \ '.' : 'search+replace in line',
      \ '/' : [':History/'              , 'history'],
      \ ';' : [':Commands'              , 'commands'],
      \ 'a' : [':Ag'                    , 'text Ag'],
      \ 'b' : [':BLines'                , 'current buffer'],
      \ 'B' : [':Buffers'               , 'open buffers'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'C' : [':BCommits'              , 'buffer commits'],
      \ 'f' : [':Files'                 , 'files'],
      \ 'g' : [':GFiles'                , 'git files'],
      \ 'G' : [':GFiles?'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'm' : [':Marks'                 , 'marks'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Helptags'              , 'help tags'] ,
      \ 'P' : [':Tags'                  , 'project tags'],
      \ 's' : [':CocList snippets'      , 'snippets'],
      \ 'S' : [':Colors'                , 'color schemes'],
      \ 't' : [':Rg'                    , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'W' : [':Windows'               , 'search windows'],
      \ 'w' : ['/\<C-r>\<C-w>\<CR>N'    , 'search word at cursor'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }
      " \ 's' : [':Snippets'     , 'snippets'],

" s is for spell
let g:which_key_map.S = {
      \ 'name' : '+spelling' ,
      \ 'A' : ['zg'                         , 'add to wordlist' ],
      \ 'F' : ['z='                         , 'fix spelling' ],
      \ 'I' : ['zG'                         , 'ignore for session' ],
      \ 'P' : ['[s'                         , 'prev misspelled word' ],
      \ 'N' : [']s'                         , 'next misspelled word' ],
      \ 'S' : ['[s'                         , 'prev misspelled word' ],
      \ 'T' : [':setlocal spell!'           , 'toggle spelling in buffer' ],
      \ 'W' : ['zw'                         , 'mark word as wrong' ],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew ipython'                           , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" w is for window
let g:which_key_map.w = {
      \ 'name' : '+window' ,
      \ '=' : ['<C-w>='                   , 'balance splits'],
      \ 'c' : ['<C-w>c'                   , 'close window'],
      \ 'H' : ['<C-w>H'                   , 'move left'],
      \ 'h' : ['<C-w>h'                   , 'change left'],
      \ 'J' : ['<C-w>J'                   , 'move down'],
      \ 'j' : ['<C-w>j'                   , 'change down'],
      \ 'K' : ['<C-w>K'                   , 'move up'],
      \ 'k' : ['<C-w>k'                   , 'change up'],
      \ 'L' : ['<C-w>L'                   , 'move right'],
      \ 'l' : ['<C-w>l'                   , 'change right'],
      \ 'o' : ['<C-w>o'                   , 'only window'],
      \ 's' : [':split'                   , 'horizontal split'],
      \ 'v' : [':vsplit'                  , 'veritcal split'],
      \ 'w' : ['<C-w>W'                   , 'other window'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

