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
    apt-get install zsh -y
fi

# Terminix is pretty cool
if hash terminix 2>/dev/null; then
    echo "terminix already installed, moving on\n" 
else
    add-apt-repository ppa:webupd8team/terminix
    apt-get update
    apt-get install terminix -y
fi

if hash aspell 2>/dev/null; then
  if hash /usr/bin/aspell 2>/dev/null; then
      echo "aspell is in the correct place, moving on\n"
  else
      cp (which aspell) /usr/local/bin/ 
  fi
else
    echo "aspell is not installed, maybe install it?"
fi
