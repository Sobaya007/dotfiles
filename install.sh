#!/usr/local/bin/fish

# Symbolic link
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vimfiles ~/.vimfiles
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.latemkrc ~/.latexmkrc
ln -sf ~/dotfiles/git-prompt ~/git-prompt

# Necessary Directory
mkdir .vimfiles
mkdir .vimfiles/backup
mkdir .vimfiles/undo
mkdir ../git

# auto install

# manual install
cd ../git
if not test -d DCD
    git clone git@github.com:dlang-community/DCD.git
end

cd DCD
dub build --build=release --config=client
dub build --build=release --config=server
mv dcd-client /usr/local/bin
mv dcd-server /usr/local/bin
cd ..

if not test -d D-Scanner
    git clone git@github.com:dlang-community/D-Scanner.git
end

cd D-Scanner
dub build --build=release
mv bin/dscanner /usr/local/bin
cd ..

cd ..
