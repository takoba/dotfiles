" ======================
" vim configuration file
" @author takoba (https://github.com/plane25)
"
" README file is here:
"
" plane25/dotfiles - GitHub
" https://github.com/plane25/dotfiles
"
" Sorry for writing some comments in Japanese, and I'll translate to English
" later.
" ======================

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
Bundle 'othree/html5.vim'
Bundle 'vim-scripts/phtml.vim'
Bundle 'vim-scripts/css_color.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'mattn/zencoding-vim'

"" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': ['ruby', 'php', 'javascript'], 
  \ 'passive_filetypes': ['html', 'phtml'] }
let g:syntastic_javascript_checker = 'gjslint'
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

"" neocomplcache
if filereadable(expand('~/.vimrc.neocomplcache'))
  source ~/.vimrc.neocomplcache
endif


filetype plugin indent on

" backspace
set backspace=indent,eol,start

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,sjis,cp932,eucjp-ms,euc-jisx0213,euc-jp
set ambiwidth=double

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

set list
set listchars=tab:>.

" highlight
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" highlight(JpSpace)
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/
