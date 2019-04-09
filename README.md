# takoba/dotfiles

## Usage

```bash
cd ~
git clone https://github.com/takoba/dotfiles.git

cd dptfiles
git submodule init
git submodule update

make
```

### bashrc

Add the following lines to your `~/.bashrc` :

```bash
if [ -f ~/dotfiles/.bashrc ]; then
  . ~/dotfiles/.bashrc
fi
```

