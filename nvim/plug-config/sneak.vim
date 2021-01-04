" Prompt for sneak
let g:sneak#prompt = ' '

highlight Sneak guifg=black guibg=#005996 ctermfg=black ctermbg=blue

" The follow hl group is used when sneak has a number prefix, which I don't
" often use
" highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow


" remap so I can use , and ; with f and t
" Note: these don't modify the jump list (for ctrl-{i,o})
map <BS> <Plug>Sneak_,
map <CR> <Plug>Sneak_;

" <CR> and <BS> work for next/prev match with these too
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T
