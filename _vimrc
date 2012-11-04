syntax on

" backspace
set backspace=indent,eol,start

" 文字コード自動判別（日本語）
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" タブ
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" タブの可視化
set list
set listchars=tab:>.

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

"" My Bundles here:
""
"" original repos on github
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'ruby.vim'
Bundle 'rails.vim'

"" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [], 
  \ 'passive_filetypes': ['html', 'javascript'] }
let g:syntastic_javascript_checker = 'gjslint'
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

filetype plugin indent on
