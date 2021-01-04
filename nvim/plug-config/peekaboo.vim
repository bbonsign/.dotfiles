" Usage:
" Peekaboo will show you the contents of the registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in insert mode.
" The sidebar is automatically closed on subsequent key strokes.
" Toggle fullscreen mode by pressing spacebar.

" Customization:
" Config 	                Default 	       Description
" g:peekaboo_window 	    vert bo 30new 	 Command for creating Peekaboo window
" g:peekaboo_delay 	      0 (ms) 	         Delay opening of Peekaboo window
" g:peekaboo_compact 	    0 (boolean) 	   Compact display
" g:peekaboo_prefix 	    Empty (string) 	 Prefix for key mapping (e.g. <leader>)
" g:peekaboo_ins_prefix 	Empty (string) 	 Prefix for insert mode key mapping (e.g. <c-x>)

let g:peekaboo_window = 'vert bo 40new'
