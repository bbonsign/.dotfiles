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

" <leader>p or <leader>i append/insert single character at cursor, but stay in
" normal mode (<leader>a is shadowed by actions below, hence the p).
nnoremap \ a_<Esc>r
nnoremap <Space>i i_<Esc>r
nnoremap <Space>p a_<Esc>r

" Alternative to Ctrl+/ for commenting lines
nnoremap <Space>/ :Commentary<CR>
vnoremap <Space>/ :Commentary<CR>

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
" let g:which_key_map['M'] = 'man pages'
let g:which_key_map['m'] = ['%'                      , '%match']
let g:which_key_map['n'] = [':NERDTreeToggle'        , 'NERTree Toggle']
let g:which_key_map['p'] = 'append character'
let g:which_key_map['q'] = ['q'                      , 'quit']
let g:which_key_map['r'] = 'access register'
let g:which_key_map['R'] = 'registers'
let g:which_key_map['T'] = [':Rg'                    , 'search text']
let g:which_key_map['W'] = ['w'                      , 'write']
let g:which_key_map['x'] = [':StripWhitespace'       , 'strip whitespace']


" Group mappings
let g:which_key_map['.'] = {
      \ 'name' : '+vimrc' ,
      \ '.' : [ ':e $MYVIMRC'                , 'open init' ],
      \ 'r' : [ ':source $MYVIMRC'           , 'reload config' ],
      \ 'h' : [ 'Startify'                   , 'start screen' ],
      \ 'S' : [ ':SSave'                     , 'save session' ],
      \ }

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'e' : [':CocCommand explorer'    , 'explorer'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 's' : [':let @/ = ""'            , 'remove search highlight'],
      \ 'S' : [':setlocal spell!'        , 'toggle spelling in buffer' ],
      \ 't' : [':FloatermToggle'         , 'terminal'],
      \ 'v' : [':Vista!!'                , 'tag viewer'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 's' : ['Scratch()' , 'scratch buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ }

" f is for file
let g:which_key_map.f = {
      \ 'name' : '+file' ,
      \ 'f' : [':Files'           , 'search files'],
      \ 's' : [':w'               , 'write file'],
      \ 'w' : [':w'               , 'write file'],
      \ }

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
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
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
      \ }


nnoremap <Space>l; A;<Esc>

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
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

" Group mappings
" TODO: Uses 'kj' for excape, currently. Change to something more staandard
let g:which_key_map.o = {
      \ 'name' : '+open line' ,
      \ 'o' : ['Okjj^'        , 'open line above'],
      \ 'b' : ['okjk^'        , 'open line below'],
      \ 's' : ['okjkOkjj^'        , 'open two lines'],
      \ }

" S is for search
let g:which_key_map.S = {
      \ 'name' : '+search' ,
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
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }
      " \ 's' : [':Snippets'     , 'snippets'],

" s is for spell
let g:which_key_map.s = {
      \ 'name' : '+spelling' ,
      \ 'a' : ['zg'                         , 'add to wordlist' ],
      \ 'f' : ['z='                         , 'fix spelling' ],
      \ 'i' : ['zG'                         , 'ignore for session' ],
      \ 'p' : ['[s'                         , 'prev misspelled word' ],
      \ 'n' : [']s'                         , 'next misspelled word' ],
      \ 's' : ['[s'                         , 'prev misspelled word' ],
      \ 'S' : [':setlocal spell!'           , 'toggle spelling in buffer' ],
      \ 'w' : ['zw'                         , 'mark word as wrong' ],
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
      \ '=' : ['<C-w>='                               , 'balance splits'],
      \ 'c' : ['<C-w>c'                               , 'close window'],
      \ 'h' : ['<C-w>h'                               , 'move left'],
      \ 'j' : ['<C-w>j'                               , 'move down'],
      \ 'k' : ['<C-w>k'                               , 'move up'],
      \ 'l' : ['<C-w>l'                               , 'move right'],
      \ 'o' : ['<C-w>W'                               , 'other window'],
      \ 's' : [':split'                               , 'horizontal split'],
      \ 'v' : [':vsplit'                              , 'veritcal split'],
      \ 'w' : ['<C-w>W'                               , 'other window'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
