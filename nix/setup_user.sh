#!/bin/bash

# no need for caps, ever again
setxkbmap -option ctrl:nocaps

git config --global user.name "Walter Manger"
git config --global user.email "walter.manger@gmail.com"

#ssh-keygen -t rsa -b 4096 -C "walter.manger@gmail.com"
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa

# aspell needs to be moved...
# Emacs expects it to be /usr/bin/aspell

# all code goes here
mkdir -p ~/go/src/github.com/walter-manger

# get my settings (https for now)
git clone https://github.com/walter-manger/dotfiles.git ~/go/src/github.com/walter-manger/dotfiles

# setup a symlink to some dotfiles 
echo "Resetting dotfiles\n"
rm ~/.emacs.d ~/.vimrc ~/.bashrc
ln -s ~/go/src/github.com/walter-manger/dotfiles/.emacs.d ~/.emacs.d
ln -s ~/go/src/github.com/walter-manger/dotfiles/.vimrc ~/.vimrc
ln -s ~/go/src/github.com/walter-manger/dotfiles/.bashrc ~/.bashrc

# go is not in the path just yet, let's put it there
if hash go 2>/dev/null; then
	echo "go already installed, moving on\n"
else 
	echo "go not installed, putting it in the path\n"
  PATH=/usr/local/go/bin:$PATH
fi

# awesome go tools
echo "Getting some go tools\n"
go get github.com/rogpeppe/godef
go get github.com/nsf/gocode
go get golang.org/x/tools/cmd/guru
go get github.com/spf13/hugo

# Dropbox
# https://www.dropbox.com/install-linux
# Headless
#cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# Somewhere down the line...
# this asks for a user/pass and sets up ~/Dropbox
#~/.dropbox-dist/dropboxd

# Setup keepass with dropbox
#keepass2

# use zsh (for now) .. Asks for pass
# TODO: check to see if installed

echo "Changing shell to zsh\n"
chsh -s $(which zsh)

# oh my zsh
echo "Installing oh-my-zsh\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Getting my config for zsh\n"
rm ~/.zshrc
ln -s ~/go/src/github.com/walter-manger/dotfiles/.zshrc ~/.zshrc

# Install node tools
# but fix permissions...
# https://docs.npmjs.com/getting-started/fixing-npm-permissions - option 2

# tern

# eslint
