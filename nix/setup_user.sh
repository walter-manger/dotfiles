# no need for caps, ever again
setxkbmap -option ctrl:nocaps

git config --global user.name "Walter Manger"
git config --global user.email "walter.manger@gmail.com"

#ssh-keygen -t rsa -b 4096 -C "walter.manger@gmail.com"
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa

# all code goes here
mkdir -p ~/go/src/github.com/walter-manger

# get my settings (https for now)
git clone https://github.com/walter-manger/dotfiles.git ~/src/github.com/walter-manger/dotfiles

# setup a symlink to some dotfiles 
ln -s ~/go/src/github.com/walter-manger/dotfiles/.emacs.d ~/.emacs.d
ln -s ~/go/src/github.com/walter-manger/dotfiles/.vimrc ~/.vimrc
ln -s ~/go/src/github.com/walter-manger/dotfiles/.bashrc ~/.bashrc

go get github.com/rogpeppe/godef
go get github.com/nsf/gocode
