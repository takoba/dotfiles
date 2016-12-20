# .bashrc

export LANG=ja_JP.UTF-8
export VISUAL='vim -u NONE'  # for Subversion
export TERM=xterm-256color

export HISTSIZE=5000

# less
export LESS='-g -i -M -R -S -W -z-4 -x4'

# User specific aliases and functions
alias ls='ls --color'
alias ll='ls -al'
alias kk="echo -e '\n\n　　　＿人人人＿\n　　　＞　kk　＜\n　　　￣Y^Y^Y^￣\n\n　　　　　　　　　　m9(^Д^)'"

# git
alias gst='git status -s -b'

# vimrc
if [ "$(uname)" == 'Darwin' ]; then
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh"
else
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
fi

# golang
if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
fi
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
