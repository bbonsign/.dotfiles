" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting

" hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" colorscheme onedark


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
hi LineNr ctermbg=NONE guibg=NONE
endif

" Make vertical separator between panes more distinct
highlight VertSplit guibg=#232733 guifg=#2d3c85 ctermbg=black ctermfg=cyan

" Make comments italized, when using a font with italics at least
highlight Comment cterm=italic gui=italic

" Override the ugly yellow search results
highlight Search guifg=white guibg=#007ACC ctermfg=white ctermbg=blue

" Red Error text for CoC
hi! CocErrorSign guifg=#B22222 gui=bold
hi Pmenu guibg=#303344
