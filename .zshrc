#!/bin/zsh
#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

export LANG=ja_JP.UTF-8
export VISUAL='vim -u NONE'  # for Subversion
export TERM=xterm-256color

export HISTSIZE=100000

zstyle ":completion:*:commands" rehash 1

fpath=($HOME/.zsh/functions $fpath)

# keybinds
bindkey -e
autoload -U select-word-style
select-word-style bash

# homebrew
if type brew &>/dev/null; then
  export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"
fi

# zsh-completions
if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh-completions $fpath)
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi
autoload -Uz compinit
compinit

# bin
if [ -e $HOME/bin ]; then
  export PATH=$HOME/bin:$PATH
fi

# direnv
export EDITOR='vim'
if type "direnv" > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# byobu
[ -f ~/.byobu/prompt ] && source ~/.byobu/prompt

# less
export LESS='-g -i -M -R -S -W -z-4 -x4'

# User specific aliases and functions
alias ls='ls -G'
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
  alias ghql="cd -- \$(ghq list --full-path --exact | peco)"
fi

# gh
if type "gh" > /dev/null 2>&1 && type "peco" > /dev/null 2>&1; then
  alias ghprl="gh pr checkout \$(gh pr list | peco | awk '{ print \$1 }')"
fi

# atuin
if type "atuin" > /dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
  eval "$(atuin gen-completions --shell zsh)"
fi

# vimrc
DEIN_DIR="$HOME/.vim/dein"
GRUVBOX_DIR="$DEIN_DIR/repos/github.com/morhetz/gruvbox"
if [ "$SSH_TTY" = "" ]; then
  # 何もしない(scpなどに影響が出るため）
  :
elif [ "$(uname)" = 'Darwin' ]; then
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
