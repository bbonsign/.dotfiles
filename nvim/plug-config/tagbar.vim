let g:tagbar_ignore_anonymous = 1

let g:tagbar_width = 40
let g:tagbar_zoomwidth = 100

let g:tagbar_compact = 1
let g:tagbar_autofocus = 1

let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_previewwin_pos = ""

highlight TagbarSignature guifg=#006f11 ctermfg=blue


" Key maps in tagbar window
" Set to empty string to disable the command

" Display key mapping help. default: <F1>/?
" let g:tagbar_map_help = ''

" Jump to the tag under the cursor. Doesn't work for pseudo-tags or generic headers. default: <CR>/<Enter>
" let g:tagbar_map_jump = ''

" Jump to the tag under the cursor, but stay in the Tagbar window. default: p
" let g:tagbar_map_preview = ''

" Open the tag in a |preview-window|. default: P
" let g:tagbar_map_previewwin = ''

" Go to the next top-level tag. default: <C-N>
let g:tagbar_map_nexttag = '<C-j>'

" Go to the previous top-level tag. default: <C-P>
let g:tagbar_map_prevtag = '<C-k>'

" Display the prototype of the current tag (i.e. the line defining it) in the command line. default: <Space>
let g:tagbar_map_showproto = 'K'

" Hide tags that are declared non-public. Tags without any visibility information will still be shown. default: v
" let g:tagbar_map_hidenonpublic = ''

" Open the fold under the cursor. default: +/zo
let g:tagbar_map_openfold = 'l'

" Close the fold under the cursor or the current one if there is no fold under the cursor. default: -/zc
let g:tagbar_map_closefold = 'h'

" Toggle the fold under the cursor or the current one if there is no fold under the cursor. default: o/za
" let g:tagbar_map_togglefold = ''

" Open all folds by setting foldlevel to 99. default: */zR
" let g:tagbar_map_openallfolds = ''

" Close all folds by setting foldlevel to 0. default: =/zM
" let g:tagbar_map_closeallfolds = ''

" Increase the fold level of the buffer by 1. Opens all folds one level. default: zr
" let g:tagbar_map_incrementfolds = ''

" Decrease the fold level of the buffer by 1. Closes all folds one level. default: zm
" let g:tagbar_map_decrementfolds = ''

" Go to the start of the next fold, like the standard Vim |zj|. default: zj
" let g:tagbar_map_nextfold = ''

" Go to the end of the previous fold, like the standard Vim |zk|. default: zk
" let g:tagbar_map_prevfold = ''

" Toggle sort order between name and file order. default: s
let g:tagbar_map_togglesort = 's'
let g:tagbar_sort = 0

" Toggle the |g:tagbar_autoclose| option. default: c
let g:tagbar_map_toggleautoclose = ''

" Toggle the pause (like :TagbarTogglePause) default: t
" let g:tagbar_map_togglepause = ''

" Toggle zooming the window. default: x
let g:tagbar_map_zoomwin = 'Z'

" Close the Tagbar window. default: q
" let g:tagbar_map_close = ''
