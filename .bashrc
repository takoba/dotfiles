# .bashrc

export LANG=ja_JP.UTF-8
export VISUAL='vim -u NONE'  # for Subversion
export TERM=xterm-256color

export HISTSIZE=5000

# bin
if [ -e $HOME/bin ]; then
  export PATH=$HOME/bin:$PATH
fi

# direnv
export EDITOR='vim'
if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

# byobu
if [ "$(uname)" == 'Darwin' ]; then
  export BYOBU_PREFIX=/usr/local
fi
[ -f ~/.byobu/prompt ] && source ~/.byobu/prompt

# less
export LESS='-g -i -M -R -S -W -z-4 -x4'

# User specific aliases and functions
if [ $(uname) == 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi
alias ll='ls -al'
alias kk="echo -e '\n\n　　　＿人人人＿\n　　　＞　kk　＜\n　　　￣Y^Y^Y^￣\n\n　　　　　　　　　　m9(^Д^)'"

# diff
if type "colordiff" > /dev/null 2>&1; then
  alias diff="colordiff"
fi

# git
alias gst='git status -s -b'

# hub
if type "hub" > /dev/null 2>&1; then
  eval "$(hub alias -s)"
fi
if [ -d /usr/local/share/git-core/contrib/diff-highlight ]; then
  export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
fi

# ghq
if type "ghq" > /dev/null 2>&1 && type "peco" > /dev/null 2>&1; then
  alias ghql='ghq get -look `ghq list | peco`'
fi

# vimrc
DEIN_DIR="$HOME/.vim/dein"
GRUVBOX_DIR="$DEIN_DIR/repos/github.com/morhetz/gruvbox"
if [ "$SSH_TTY" == "" ]; then
  # 何もしない(scpなどに影響が出るため）
  :
elif [ "$(uname)" == 'Darwin' ]; then
  [ -d $GRUVBOX_DIR ] && source "$GRUVBOX_DIR/gruvbox_256palette_osx.sh"
else
  [ -d $GRUVBOX_DIR ] && source "$GRUVBOX_DIR/gruvbox_256palette.sh"
fi

# golang
if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
fi
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
