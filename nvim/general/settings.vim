" Comments in Vimscript start with a `"`.

scriptencoding utf-8
set encoding=UTF-8

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Copy/paste between vim and everything else
set clipboard=unnamedplus

" Turn on syntax highlighting.
syntax on
set termguicolors
" let base16colorspace=256
set background=dark

" Allow persistent undo history
set undofile

" Show line numbers.
set number
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
" set incsearch
" Alternative found here <https://github.com/romainl/vim-cool/issues/9>
" which turns of serach highlight after non-search keys (i.e. not *,n,N,/,?)
noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

fu! HlSearch()
    let s:pos = match(getline('.'), @/, col('.') - 1) + 1
    if s:pos != col('.')
        call StopHL()
    endif
endfu

fu! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
        sil call feedkeys("\<Plug>(StopHL)", 'm')
    endif
endfu

augroup SearchHighlight
au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end


" Live highlight and substituion preview
" 'split' is another option that shows preview of changes in temp split
" window, useful for previews outside of the current view of the file
set inccommand=nosplit

" Show cursor line only normal mode and current window
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support.
set mouse+=a

" indentation stuff
set smartindent  " For programming
set autoindent   " Copy indent from current line when starting a new line
set breakindent  " Use same indent for wrapped text

" set scrolloff=8

" tabs and spaces
set tabstop=2     " Insert 2 spaces for tab
set shiftwidth=2  " Change number of space characters inserted for indentation
set smarttab      " Make tabbing realize when 2 vs 4
set expandtab     " Converts tabs to spaces

" Horizontal splits below, vertical to the right
set splitbelow
set splitright

highlight Comment cterm=italic gui=italic

" Run :FZF for file selection + preview
set rtp+=/usr/local/opt/fzf

" Recommended by coc
set nobackup
set nowritebackup

set noswapfile

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience. Also from coc
set updatetime=300

set timeoutlen=300
set ttimeoutlen=0

" To prevent conflict with <space> in tagbar
let g:tagbar_map_showproto = "K"

" Recommended by VimWiki
filetype plugin on

" Open help in vertical splits. Seems to split across all windows,
" not just in the active window
" autocmd FileType help wincmd L

" Open a scratch buffer in a split
" TODO: Look for open scratch buffer to switch to first
function! Scratch()
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction

" For the jrnl command.  It opens nvim with a temp file that starts with
" 'jrnl...'
augroup SpellCheckGroup
  au! BufRead,BufNewFile,BufEnter jrnl* set filetype=markdown | set spell
  au! BufRead,BufNewFile,BufEnter scrumbot set spell
augroup END

" Strip trailing white space on save
augroup TrailingWhiteSpace
  function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun

  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

" From https://github.com/nelstrom/vim-visual-star-search/blob/master/plugin/visual-star-search.vim
" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" " recursively vimgrep for word under cursor or selection if you hit leader-star
" if maparg('<leader>*', 'n') == ''
"   nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
" endif
" if maparg('<leader>*', 'v') == ''
"   vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
" endif

let g:csv_nomap_cr = 1

" Force write readonly files using sudo
command! WS w !sudo tee %
