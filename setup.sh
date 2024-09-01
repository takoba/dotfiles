#!/bin/sh

function raise () {
    echo $1 1>&2
    return 1
}

function is_macOS () {
    return $(test "$(uname)" = "Darwin")
}

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
    src=$CURDIR/$1
    dst=$HOME/$1
	echo "Create Symlink: $src => $dst"
	ln -snf $src $dst
}
function remove () {
    target=$HOME/$1
    echo "Remove file: $target"
	if [ -f $target ]; then
        rm $target
    else
        echo "INFO: remove was not worked. (because $target is not exist)"
    fi
}
function unlink () {
    target=$HOME/$1
    echo "Unlink Symlink: $target"
	if [ -L $target ]; then
        rm $target
    else
        echo "INFO: unlink was not worked. (because $target is not exist)"
    fi
}
function zshrc () {
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

    echo ${body%%\\n} > $dst
}

function subcommand__init () {
    targets=(${VIM_TARGETS[@]} ${GIT_TARGETS[@]} ${DIRENV_TARGETS[@]})
    for target in ${targets[@]}; do
        link $target
    done

    zshrc
}
function subcommand__cleanup () {
    targets=(${VIM_TARGETS[@]} ${GIT_TARGETS[@]} ${DIRENV_TARGETS[@]})
    for target in ${targets[@]}; do
        unlink $target
    done

    remove ".zshrc"
}

subcommand="$1"
dispatchto="subcommand__$subcommand"
shift
if type $dispatchto >/dev/null 2>&1; then
    $dispatchto "$@"
else
    if [ -z $subcommand ]; then
        raise "ERROR: missing subcommand. Usage: ./setup.sh [subcommand]"
    else
        raise "ERROR: Unknown subcommand: \"$subcommand\""
    fi

    exit $?
fi
