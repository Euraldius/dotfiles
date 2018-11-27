# Assumptions

* System: Mac OS
* Shell: zsh
* Text editor: vim
* Vim package manager: Vundle

# Setup for Mac OS

## 1. Set your shell to zsh

```bash
chsh -s `which zsh`
```

## 2. Clone this repo in your user root

```zsh
git clone git@github.com:Euraldius/dotfiles.git ~
```

## 3. Create symlinks

```zsh
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vimrc.bundles ~/.vimrc.bundles
ln -s ~/dotfiles/zshrc ~/.zshrc
```

# Vim setup

Install Vundle. Follow its [instructions for setup](https://github.com/VundleVim/Vundle.vim#quick-start). Use `:PluginInstall` to install packages.
