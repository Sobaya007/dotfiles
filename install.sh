#!/usr/local/bin/fish

# Symbolic link
ln -sf ~/dotfiles/.vimfiles ~/.vimfiles
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/dein ~/.config/dein
ln -sf ~/dotfiles/.config/fish ~/.config/fish
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

# Necessary Directory
mkdir ~/.vimfiles
mkdir ~/.vimfiles/backup
mkdir ~/.vimfiles/undo
mkdir ~/git
