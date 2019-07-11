sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-add-repository -y ppa:neovim-ppa/stable

sudo apt update
sudo apt install -y neovim fish tmux silversearcher-ag nodejs npm

sudo npm install n -g
sudo n stable
sudo apt purge -y nodejs npm

sudo wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
sudo apt-get update && sudo apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
sudo apt-get update
sudo apt-get install dub

fish install.fish
