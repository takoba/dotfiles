syntax on

"" bundle install...
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()

"" My Bundles here:
""
"" original repos on github
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'Shougo/unite.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/surround.vim'
Bundle 'sudo.vim'
Bundle 'pig.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-quickrun'
Bundle 'm2ym/rsense'

"" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': ['ruby', 'php', 'javascript'], 
  \ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checker = 'gjslint'
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

"" neocomplcache
if filereadable(expand('~/.vimrc.neocomplcache'))
  "source ~/.vimrc.neocomplcache
endif


filetype plugin indent on

" backspace
set backspace=indent,eol,start

" $BJ8;z%3!<%I<+F0H=JL!JF|K\8l!K(B
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set ambiwidth=double

" $B%?%V(B
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" $B%?%V$N2D;k2=(B
set list
set listchars=tab:>.

" highlight
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" highlight(JpSpace)
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /$B!!(B/
