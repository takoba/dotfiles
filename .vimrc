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

let s:vim_dir = expand('~/.vim')
let s:dein_dir = s:vim_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif
if &runtimepath !~# '/dein.vim'
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:toml_lazy = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, { 'lazy': 0 })
  call dein#load_toml(s:toml_lazy, { 'lazy': 1 })

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" backspace
set backspace=indent,eol,start

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,sjis,cp932,eucjp-ms,euc-jisx0213,euc-jp
set ambiwidth=double

" indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

" listchars
set list
set listchars=tab:>.

" colorscheme
set background=dark
colorscheme gruvbox

" highlight
autocmd ColorScheme * highlight DiffAdd    ctermfg=black ctermbg=2
autocmd ColorScheme * highlight DiffChange ctermfg=black ctermbg=3
autocmd ColorScheme * highlight DiffDelete ctermfg=black ctermbg=6
autocmd ColorScheme * highlight DiffText   ctermfg=black ctermbg=7
autocmd ColorScheme * highlight SpecialKey cterm=NONE ctermfg=7 guifg=#B3B3B3
" highlight(JpSpace)
"autocmd ColorScheme * highlight JpSpace cterm=underline ctermfg=7 guifg=#B3B3B3
"au BufRead,BufNew * match JpSpace /　/

set hlsearch

" open ctag in tab/vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" - number
set nu

" - mouse
set mouse=

" - tab
if filereadable(expand('~/.vimrc.tab'))
  source ~/.vimrc.tab
endif
