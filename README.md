## 管理しようと思ってるファイル

* ~/.vimrc
* ~/.bashrc
  * これは環境に依存する記述とかありそうだからincludeするタイプとかにする

  ```:~/.bashrc
    if [ -f ~/dotfiles/.bashrc ]; then
      . ~/dotfiles/.bashrc
    fi
  ```

* ~/.zshrc

## vundleのつかいかた
git cloneしただけだと使えなかったりする。

```
cd ~/dotfiles
git submodule init
git submodule update
```

ってかんじでsubmoduleを追加してあげる。
