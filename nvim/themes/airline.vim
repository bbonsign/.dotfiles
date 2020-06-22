" enable tabline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let airline#extensions#tabline#show_splits = 0
" let airline#extensions#tabline#tabs_label = ''
" " Just show the file name
" let g:airline#extensions#tabline#fnamemod = ':t'

" " Disable tabline close button -- Can't seem to get it to show up!!
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#close_symbol = 'X'
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#show_tab_nr = 0
" let g:airline#extensions#tabline#fnamecollapse = 1

" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#buffers_label = ''
" let g:airline#extensions#tabline#tabs_label = ''


" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


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

