#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vimfiles ~/.vimfiles
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.latemkrc ~/.latexmkrc
ln -sf ~/dotfiles/git-prompt ~/git-prompt

mkdir .vimfiles
mkdir .vimfiles/backup
mkdir .vimfiles/undo
