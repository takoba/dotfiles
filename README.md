# takoba/dotfiles

## premises

- Setup zsh, vim, git, and direnv
- In main, uses macOS.
    - But i hope that the repo might be supporting POSIX shell

## Usage

```sh
git clone https://github.com/takoba/dotfiles.git ~/dotfiles
cd ~/dotfiles

git submodule init
git submodule update
make

# cleanup
make clean
```
