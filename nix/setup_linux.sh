#!/bin/bash

# TODO: Make sure all of the installs check first
# TODO: Find out if running all of this with sudo messes up the installs

# get the best vim 
if hash vim 2>/dev/null; then
    echo "vim already installed, moving on\n"
else 
  apt-get install vim -y
fi

# must have git
if hash git 2>/dev/null; then
	echo "git already installed, moving on\n"
else 
	apt-get install git -y
fi

# get xclip to for easier copying of ssh keys
if hash xclip 2>/dev/null; then
 	echo "xclip already installed, moving on\n"
else 
	apt-get install xclip -y
fi   

# build-essential will bring in everything I need to build emacs
apt install build-essential checkinstall

if hash emacs 2>/dev/null; then
    echo "emacs already installed, moving on\n" 
else
  # all the dependencies for 25 are also in 24
  apt-get build-dep emacs24

  # the source for emacs25
  curl ftp://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz -o ~/Downloads/emacs-25.1.tar.gz

  # let's make a habit of doing things inside of Dwonloads
  cd ~/Downloads

  tar -xvzf emacs-25.1.tar.gz

  cd emacs-25.1

  ./configure

  make

  # build a debpkg and install
  checkinstall
fi

# I like using hack at the moment
apt-get install fonts-hack-ttf -y

# nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# go
curl https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz -o ~/Downloads/go1.8.linux-amd64.tar.gz

tar -C /usr/local -xzf ~/Downloads/go1.8.linux-amd64.tar.gz

if hash keepass2 2>/dev/null; then
    echo "keepass2 already installed, moving on\n" 
else
  apt-add-repository ppa:jtaylor/keepass -y
  apt-get update
  apt-get install keepass2 -y
fi

if hash zsh 2>/dev/null; then
    echo "zsh already installed, moving on\n" 
else
    apt-get install zsh
fi
