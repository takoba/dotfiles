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

" - NeoBundle
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

" - vimproc
NeoBundle 'Shougo/vimproc'

" - unite.vim
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,e  :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,nb :<C-u>Unite neobundle<CR>
nnoremap <silent> ,nbs :<C-u>Unite neobundle/search<CR>

NeoBundle 'Shougo/vimfiler.vim' " Powerful file explorer implemented by Vim script
  \ , { 'depends' :
  \       [ 'Shougo/unite.vim'
  \       ]
  \   }
NeoBundle 'vim-scripts/surround.vim' " Delete/change/add parentheses/quotes/XML-tags/much more with ease
NeoBundle 'Shougo/vimshell'
  \ , { 'depends' :
  \     [ 'Shougo/vimproc'
  \     ]
  \   }
nnoremap <silent> ,is <C-u>:VimShellTab<CR>
NeoBundle 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim

" - bufkill.vim
NeoBundle 'ryakh/bufkill.vim' " Unload/delete/wipe a buffer, keep its window(s), display last accessed buffer(s) 
NeoBundle 'tyru/vim-altercmd' " Vim plugin: Alter built-in Ex commands by your own ones
call altercmd#load()
AlterCommand bd BD
AlterCommand BD bd

" - html
NeoBundle 'othree/html5.vim'
"NeoBundle 'vim-scripts/css_color.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'mattn/zencoding-vim'
" - php
NeoBundle 'vim-scripts/phtml.vim'
" - javascript
NeoBundle 'pangloss/vim-javascript'
" - ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'm2ym/rsense'
" - pig
NeoBundle 'pig.vim'
" - git
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
" - Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
  \ , { 'depends' :
  \     [ 'thinca/vim-quickrun'
  \     , 'tyru/open-browser.vim'
  \     ]
  \   }

"" quickrun.vim
NeoBundle 'thinca/vim-quickrun' " Run commands quickly.
"let g:quickrun_config = {'*': {'hook/time/enable': 1},}
let g:quickrun_config = {
  \   'markdown': {
  \     'type': 'markdown/gfm',
  \     'outputter': 'browser'
  \   }
  \ }

" - lightline.vim
NeoBundle 'itchyny/lightline.vim'
  \ , { 'depends' :
  \     [ 'tpope/vim-fugitive'
  \     , 'airblade/vim-gitgutter'
  \     ]
  \   }
if filereadable(expand('~/.vimrc.lightline'))
  source ~/.vimrc.lightline
endif

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

"" gtiv
"autocmd FileType git :setlocal foldlevel=99

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

" - tab
if filereadable(expand('~/.vimrc.tab'))
  source ~/.vimrc.tab
endif
