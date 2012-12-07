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

" 文字コード自動判別（日本語）
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set ambiwidth=double

" タブ
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" タブの可視化
set list
set listchars=tab:>.

" highlight
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" highlight(JpSpace)
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/
