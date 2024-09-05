#!/bin/sh

raise () {
    echo "$1" 1>&2
    return 1
}

is_macOS () {
    # shellcheck disable=SC2046
    return $(test "$(uname)" = "Darwin")
}

VIM_TARGETS="$(cat <<- EOL | tr "\n" " "
.vimrc
.vim
.vimrc.neocomplcache
.vimrc.tab
.vimrc.lightline
.vimrc.indent
EOL
)"

GIT_TARGETS="$(cat <<EOL | tr "\n" " "
.gitconfig
.gitignore
.git_commit_template
EOL
)"

DIRENV_TARGETS="$(cat <<EOL | tr "\n" " "
.direnvrc
EOL
)"

CURDIR="$(cd "$(dirname "$0")" || exit; pwd)"

link () {
    src=$CURDIR/$1
    dst=$HOME/$1
	echo "Create Symlink: $src => $dst"
	ln -snf "$src" "$dst"
}
remove () {
    target=$HOME/$1
    echo "Remove file: $target"
	if [ -f "$target" ]; then
        rm "$target"
    else
        echo "INFO: remove was not worked. (because $target is not exist)"
    fi
}
unlink () {
    target=$HOME/$1
    echo "Unlink Symlink: $target"
	if [ -L "$target" ]; then
        rm "$target"
    else
        echo "INFO: unlink was not worked. (because $target is not exist)"
    fi
}
zshrc () {
    dst=$HOME/.zshrc
	echo "Create file: $dst"

    body=""

    # in first, load a common rc file
    commonrcsrc=$CURDIR/.zshrc
    body+="[ -f $commonrcsrc ] && . $commonrcsrc\n"

    # in last, load some optional rc file what according to the env
    if is_macOS; then
        macosrcsrc=$CURDIR/.macos.zshrc
        body+="[ -f $macosrcsrc ] && . $macosrcsrc\n"
    fi

    echo "${body%%\\n}" > "$dst"
}

subcommand__init () {
    targets=$VIM_TARGETS$GIT_TARGETS$DIRENV_TARGETS
    # shellcheck disable=SC2086
    set -- $targets
    for target in "$@"; do
        link "$target"
    done

    zshrc
}
subcommand__cleanup () {
    targets=$VIM_TARGETS$GIT_TARGETS$DIRENV_TARGETS
    # shellcheck disable=SC2086
    set -- $targets
    for target in "$@"; do
        unlink "$target"
    done

    remove ".zshrc"
}

subcommand="$1"
dispatchto="subcommand__$subcommand"
shift
if type "$dispatchto" >/dev/null 2>&1; then
    $dispatchto "$@"
else
    if [ -z "$subcommand" ]; then
        raise "ERROR: missing subcommand. Usage: ./setup.sh [subcommand]"
    else
        raise "ERROR: Unknown subcommand: \"$subcommand\""
    fi

    exit $?
fi
