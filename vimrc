"                           General Settings
"                           ---------------
syn on
" Note: plugin is important to invoke latex-suite
filetype indent plugin on
set ignorecase
set smartcase
set expandtab
set tabstop=8
set shiftwidth=8
set softtabstop=8
set scrolloff=8
set backspace=indent,eol,start
set nohlsearch
set confirm
set list listchars=tab:»·,trail:·,extends:>,nbsp:_
" Turn the mouse off (Arch sets it by default)
set mouse=
" Next two commands make vim use X11 clipboard
imap <BS> <C-H>
set clipboard=unnamed
:nnoremap <expr> p (v:register == '"' && &clipboard =~ 'unnamed' ? '"*p' : '"' . v:register . 'p')
" Make integration stuff
map <F2> :make<Enter>
nmap e :cn<Enter>
nmap E :cN<Enter>
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat 
" Highlight characters that go over 80 columns
:highlight OverLength ctermbg=blue ctermfg=white guibg=blue guifg=white
" :match OverLength '\%82v.*'

"                           Vala Highlighting
"                           -----------------
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
au! Syntax vala source $VIM/syntax/cs.vim

"                          Paren Autocompletion
"                          ---------------------
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

"                            Vim-Latex Stuff 
"                            ---------------
" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to alway generate a file-name.
set grepprg=grep\ -nH\ $*
" TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
set iskeyword+=:
let g:tex_flavor="latex"
