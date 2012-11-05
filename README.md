## 管理しようと思ってるファイル

~/.vimrc
~/.bashrc <- これは環境に依存する記述とかありそうだからincludeするタイプで
#--- Source global definitions
#if [ -f /etc/bashrc ]; then
#    . /etc/bashrc
#fi
~/.zshrc

## vundleのつかいかた
git cloneしただけだと使えなかったりする。

  ```terminal

  cd ~/dotfiles
  git submodule init
  git submodule update

  ```

ってかんじでsubmoduleを追加してあげる。
