syntax on

" expand tab
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" listchars
set lcs=tab:>.,extends:\
set list

" highlight
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" highlight(JpSpace)
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/

"" bundle install...
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'ruby.vim'
Bundle 'rails.vim'

filetype plugin indent on
