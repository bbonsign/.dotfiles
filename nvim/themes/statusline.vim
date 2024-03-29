" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" Switch to your current theme
let g:airline_theme = 'onedark'

" Always show tabs
" set showtabline=2

" Sections
" let g:airline_section_c = ''
" let g:airline_section_a = "Mach 2"
" let g:airline_section_a = ""
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1

" set the CN (column number) symbol:
" let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

" Disable coc-integration mainly b/c with python virtual envs, the virtual env
" and architechure info take up too much space and hide the filename.  wtf?
let g:airline#extensions#coc#enabled = 0


