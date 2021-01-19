" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :silent <c-u> :silent WhichKey '\'<CR>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual '\'<CR>


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

" Another way to jump to marks
nnoremap <leader>j '
vnoremap <leader>j '

" <leader>p or <leader>i append/insert single character at cursor, but stay in
" If no character is chosen before going back to normal mode, a space is left.
" normal mode (<leader>a is shadowed by actions below, hence the p).
" nnoremap \ a<Space><Esc>r
nnoremap <leader>i i<Space><Esc>r
nnoremap <leader>p a<Space><Esc>r

" Alternative to Ctrl+/ for commenting lines
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" Single mappings
let g:which_key_map['!'] = [':.!bash'                , 'send line to bash']
" let g:which_key_map['/'] = [':Commentary'            , 'comment']
let g:which_key_map['/'] = 'comment'
let g:which_key_map[':'] = [':Commands'              , 'commands']
let g:which_key_map['='] = ['z='                     , 'correct spelling']
let g:which_key_map[','] = ['Buffers'                , 'fzf-buffer']
" let g:which_key_map['d'] = ['%'                      , '%']
let g:which_key_map['E'] = [':CocCommand explorer'   , 'explorer']
let g:which_key_map['F'] = [':Files'                 , 'search files']
let g:which_key_map['i'] = 'insert character'
let g:which_key_map['j'] = 'jump to mark'
" let g:which_key_map['M'] = 'man pages'
let g:which_key_map['m'] = ['%'                      , '%match']
let g:which_key_map['n'] = 'nohlsearch'
let g:which_key_map['p'] = 'append character'
let g:which_key_map['q'] = ['q'                      , 'quit']
let g:which_key_map['T'] = [':Rg'                    , 'search text']
let g:which_key_map['W'] = ['w'                      , 'write']
let g:which_key_map['X'] = ['ciw \<Esc>'             , 'trim to one space between words']
let g:which_key_map['x'] = [':StripWhitespace'       , 'strip whitespace']


" Group mappings
let g:which_key_map['.'] = {
      \ 'name' : '+vimrc' ,
      \ '.' : [ ':e $MYVIMRC'                , 'open init' ],
      \ 'r' : [ ':source $MYVIMRC'           , 'reload config'],
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



let g:which_key_map.d = {
      \ 'd' : '->black hole',
      \ 'D' : '->black hole',
      \ }

" E for easymotion
" for more ergonomic upper-case mappings
let g:which_key_map.E = {
      \ 'name': '+Easymotion' ,
      \ '}' : ['<Plug>(easymotion-next)'           ,  'next'],
      \ '{' : ['<Plug>(easymotion-previous)'       ,  'previous'],
      \ 'E' : ['<Plug>(easymotion-ge)'             ,  'end of word above'],
      \ 'F' : ['<Plug>(easymotion-overwin-f)'      ,  'overwin f'],
      \ 'J' : ['<Plug>(easymotion-eol-j)'          ,  'eol-j'],
      \ 'K' : ['<Plug>(easymotion-eol-k)'          ,  'eol-k'],
      \ 'L' : ['<Plug>(easymotion-overwin-line)'   ,  'overwin line'],
      \ 'N' : ['<Plug>(easymotion-N)'              ,  'N'],
      \ 'W' : ['<Plug>(easymotion-overwin-w)'      ,  'overwin word'],
      \ }

" e for symotion
let g:which_key_map.e = {
      \ 'name': '+easymotion' ,
      \ '.' : ['<Plug>(easymotion-repeat)'         ,  'repeat'],
      \ ']' : ['<Plug>(easymotion-next)'           ,  'next'],
      \ '[' : ['<Plug>(easymotion-previous)'       ,  'previous'],
      \ 'b' : ['<Plug>(easymotion-b)'              ,  'word, above '],
      \ 'E' : ['<Plug>(easymotion-ge)'             ,  'end of word above'],
      \ 'e' : ['<Plug>(easymotion-e)'              ,  'end of word'],
      \ 'f' : ['<Plug>(easymotion-f)'              ,  'f'],
      \ 'J' : ['<Plug>(easymotion-eol-j)'          ,  'eol-j'],
      \ 'j' : ['<Plug>(easymotion-j)'              ,  'lines up'],
      \ 'K' : ['<Plug>(easymotion-eol-k)'          ,  'eol-k'],
      \ 'k' : ['<Plug>(easymotion-k)'              ,  'line motion'],
      \ 'l' : ['<Plug>(easymotion-bd-jk)'          ,  'lines'],
      \ 'N' : ['<Plug>(easymotion-N)'              ,  'N'],
      \ 'n' : ['<Plug>(easymotion-n)'              ,  'n'],
      \ 's' : ['<Plug>(easymotion-sn)'             ,  'sn'],
      \ 't' : ['<Plug>(easymotion-t)'              ,  't'],
      \ 'w' : ['<Plug>(easymotion-w)'              ,  'word, below'],
      \ }


" f is for file
nnoremap <leader>fe :e<Space>
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
      \ 's' : [':Helptags'              , 'fzf helptags'],
      \ 't' : [':Helptags'              , 'fzf helptags'],
      \ 'z' : [':help z'                , 'z commands'],
      \ }


nnoremap <leader>l: A;<Esc>

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ':' : 'append ;',
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'F' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'f' : ['<Plug>(coc-format)'                  , 'format'],
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
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
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


" Another way to access registers easily
nmap <leader>r <Plug>(peekaboo)
vmap <leader>r <Plug>(peekaboo)
" The following aren't needed with the vim-peekaboo plugin
" nnoremap <leader>R :registers<CR>
" vnoremap <leader>R :registers<CR>
let g:which_key_map.r = 'access register'

" Short cuts for using vimslinme to send paragraphs to a repl in another tmux
" pane.  Defined in ../plug-config/vim-slime.vim
let g:which_key_map.R = {
      \ 'name' : '+repl' ,
      \ 'H' : 'send to pane left',
      \ 'J' : 'send to pane below',
      \ 'K' : 'send to left above',
      \ 'L' : 'send to pane right',
      \ }


" s is for search
" Shortcut for starting a search+replace current word in whole buffer & in line
nnoremap <leader>s% :%s/<c-r>=expand("<cword>")<cr>//g<Left><Left>
nnoremap <leader>s. :.s/<c-r>=expand("<cword>")<cr>//g<Left><Left>
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '%' : 'search+replace in file',
      \ '.' : 'search+replace in line',
      \ '/' : [':History/'              , 'history'],
      \ ':' : [':Commands'              , 'commands'],
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
      \ 'M' : [':Marks'                 , 'marks'] ,
      \ 'm' : [':Maps'                  , 'normal maps'] ,
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


" S is for Spell
let g:which_key_map.S = {
      \ 'name' : '+spelling',
      \ 'A' : ['zg'                  , 'add to wordlist' ],
      \ 'F' : ['z='                  , 'fix spelling' ],
      \ 'i' : ['zG'                  , 'ignore for session' ],
      \ 'P' : ['[sz='                , 'fix prev misspelled word' ],
      \ 'p' : ['[s'                  , 'prev misspelled word' ],
      \ 'N' : [']sz='                , 'fix next misspelled word' ],
      \ 'n' : [']s'                  , 'next misspelled word' ],
      \ 'S' : ['[s'                  , 'prev misspelled word' ],
      \ 'T' : [':setlocal spell!'    , 'toggle spelling in buffer' ],
      \ 'W' : ['zw'                  , 'mark word as wrong' ],
      \ }

let g:which_key_map.S.I = {
      \ 'name' : '+ignore',
      \ 'I' : ['zG'                  , 'ignore for session' ],
      \ 'P' : ['[szG'                , 'ignore previous' ],
      \ 'N' : [']szG'                , 'ignore next' ],
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
" <leader>w{t,z} 'zooms' a widow by creating a new tab, which can be closed to
" return to the previous splits
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
      \ 'r' : ['<C-w>r'                   , 'rotate windows ->'],
      \ 'R' : ['<C-w>R'                   , 'rotate windows <-'],
      \ 's' : [':split'                   , 'horizontal split'],
      \ 't' : [':tab sp'                  , 'new tab w/ current buf'],
      \ 'v' : [':vsplit'                  , 'veritcal split'],
      \ 'w' : ['<C-w>W'                   , 'other window'],
      \ 'z' : [':tab sp'                  , 'new tab w/ current buf'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

