#!/bin/sh

readonly VIM_TARGETS=($(cat <<EOL
.vimrc
.vim
.vimrc.neocomplcache
.vimrc.tab
.vimrc.lightline
.vimrc.indent
EOL
))
readonly GIT_TARGETS=($(cat <<EOL
.gitconfig
.gitignore
.git_commit_template
EOL
))
readonly DIRENV_TARGETS=($(cat <<EOL
.direnvrc
EOL
))

readonly CURDIR=$(cd $(dirname $0); pwd)

function link () {
    SRC=$CURDIR/$1
    DST=$HOME/$1
	echo "Create Symlink: $SRC => $DST"
	ln -snf $SRC $DST
}
function remove () {
    TARGET=$HOME/$1
    echo "Remove file: $TARGET"
	if [ -f $TARGET ]; then
        rm $TARGET
    else
        echo "INFO: remove was not worked. (because $TARGET is not exist)"
    fi
}
function unlink () {
    TARGET=$HOME/$1
    echo "Unlink Symlink: $TARGET"
	if [ -L $TARGET ]; then
        rm $TARGET
    else
        echo "INFO: unlink was not worked. (because $TARGET is not exist)"
    fi
}
function zshrc () {
    SRC=$CURDIR/.zshrc
    DST=$HOME/.zshrc
	echo "Create file: $DST"
    echo "[ -f $SRC ] && . $SRC" > $DST
}

function init () {
    targets=(${VIM_TARGETS[@]} ${GIT_TARGETS[@]} ${DIRENV_TARGETS[@]})
    for target in ${targets[@]}; do
        link $target
    done

    zshrc
}
function cleanup () {
    targets=(${VIM_TARGETS[@]} ${GIT_TARGETS[@]} ${DIRENV_TARGETS[@]})
    for target in ${targets[@]}; do
        unlink $target
    done

    remove ".zshrc"
}

subcommand="$1"

case $subcommand in
    init)
        init
        ;;
    cleanup)
        cleanup
        ;;
    *)
        if [ -z $subcommand ]; then
            echo "ERROR: missing subcommand. Usage: ./setup.sh [subcommand]"
        else
            echo "ERROR: Unknown subcommand: '$subcommand'"
        fi
        exit 1
        ;;
esac