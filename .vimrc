" ======================
" vim configuration file
" @author takoba (https://github.com/takoba)
"
" README file is here:
"
" takoba/dotfiles - GitHub
" https://github.com/takoba/dotfiles
"
" Sorry for writing some comments in Japanese, and I'll translate to English
" later.
" ======================

syntax on

"" NeoBundle install...
set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'


"" My Bundles here:
""
"" original repos on github
"Bundle 'fholgado/minibufexpl.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/surround.vim'
NeoBundle 'sudo.vim'
NeoBundle 'pig.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'm2ym/rsense'
NeoBundle 'othree/html5.vim'
NeoBundle 'vim-scripts/phtml.vim'
NeoBundle 'vim-scripts/css_color.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'Markdown'
NeoBundle 'Markdown-syntax'

"" syntastic
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': ['ruby', 'php', 'javascript'], 
  \ 'passive_filetypes': ['html', 'phtml'] }
let g:syntastic_javascript_checker = 'gjslint'
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

"" neocomplcache
NeoBundle 'Shougo/neocomplcache'
if filereadable(expand('~/.vimrc.neocomplcache'))
  source ~/.vimrc.neocomplcache
endif

"" quickrun.vim
NeoBundle 'quickrun.vim'
let g:quickrun_config = {'*': {'hook/time/enable': 1},}

filetype plugin indent on  " Required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" ---
" backspace
set backspace=indent,eol,start

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,sjis,cp932,eucjp-ms,euc-jisx0213,euc-jp
set ambiwidth=double

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

set list
set listchars=tab:>.

" highlight
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" highlight(JpSpace)
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/

set nu

