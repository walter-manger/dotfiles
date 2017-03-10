#!/bin/bash

# build-essential will bring in everything I need to build emacs
apt install build-essential checkinstall

if hash emacs 2>/dev/null; then
    echo "emacs already installed, moving on\n" 
else
  # all the dependencies for 25 are also in 24
  apt-get build-dep emacs24

  # the source for emacs25
  curl ftp://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz -o ~/Downloads/emacs-25.1.tar.gz

  # let's make a habit of doing things inside of Downloads
  cd ~/Downloads

  tar -xvzf emacs-25.1.tar.gz

  cd emacs-25.1

  ./configure

  make

  # build a debpkg and install
  checkinstall
fi
