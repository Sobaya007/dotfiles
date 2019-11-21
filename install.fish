# remove previous .vimfiles directory
if test -d ~/.vimfiles
    rm -rf ~/.vimfiles
end

# Symbolic link
function linkDotFiles
    if not test -L ~/$argv
        rm -rf ~/$argv
    	ln -sf ~/dotfiles/$argv ~/$argv
    end
end

linkDotFiles .vimfiles
linkDotFiles .tmux.conf
linkDotFiles .config/dein
linkDotFiles .config/fish
linkDotFiles .config/nvim

functions --erase linkDotFiles

# setup directories
function setup
    if not test -e ~/.vimfiles/$argv
        mkdir ~/.vimfiles/$argv
    end
end
setup backup
setup undo
setup git

functions --erase setup

# install js/ts language server

if not type -q typescript-language-server
    sudo npm i typescript-language-server -g
end

# install d language server
if not test -e ~/.dub/packages/.bin/dls-latest/dls 
    dub fetch dls
    and dub run dls:bootstrap
end
