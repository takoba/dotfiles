## homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

## gnu-sed
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
## gnu-grep
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
## curl
PATH="/opt/homebrew/opt/curl/bin:$PATH"

# anyenv
eval "$(anyenv init -)"

# byobu
export BYOBU_PREFIX=/opt/homebrew
[ -f ~/.byobu/prompt ] && source ~/.byobu/prompt

# aliases
alias ls='ls --color'
