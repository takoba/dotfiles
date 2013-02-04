## 管理しようと思ってるファイル

* ~/.vimrc
* ~/.bashrc
  * これは環境に依存する記述とかありそうだから、~/.bashrcにincludeするタイプとかにする

  ```:~/.bashrc
    if [ -f ~/dotfiles/.bashrc ]; then
      . ~/dotfiles/.bashrc
    fi
  ```

* ~/.zshrc

## NeoBundleのつかいかた
git cloneしただけだと使えなかったりする。

```
cd ~/dotfiles
git submodule init
git submodule update
```

ってかんじでsubmoduleを追加してあげる。

## つかってるplug-inについて
必要に応じてやるべきことを書いときます。

### vim-proc
:NeoBundleInstall をしたら、次の操作もしておく

```
$ cd ~/dotfiles/.vim/bundle/vimproc
$ make -f make_***.mak  // 環境に合わせたmakファイルを利用する（ちゃんと用意されてるはず）
```
