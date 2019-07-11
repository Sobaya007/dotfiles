# Symbolic link
sudo rm -rf ~/.vimfiles

ln -sf ~/dotfiles/.vimfiles ~/.vimfiles
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

rm -rf ~/.config/dein
ln -sf ~/dotfiles/.config/dein ~/.config/dein

rm -rf ~/.config/fish
ln -sf ~/dotfiles/.config/fish ~/.config/fish

rm -rf ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

# Necessary Directory
mkdir ~/.vimfiles/backup
mkdir ~/.vimfiles/undo
mkdir ~/git

# install js/ts language server
git clone git@github.com:sourcegraph/javascript-typescript-langserver.git ~/git/javascript-typescript-langserver; and cd ~/git/javascript-typescript-langserver; and npm install; and npm run build;

# install d language server
dub fetch dls
