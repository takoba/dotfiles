" タブ幅
set softtabstop=4
set expandtab
" タブを表示する時の幅
set tabstop=4
" タブを挿入する時の幅
set shiftwidth=4

" listchars
set lcs=tab:>.,extends:\
set list

" highlight
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" highlight(JpSpace)
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/
