# no need for caps, ever again
setxkbmap -option ctrl:nocaps

# use zsh (for now) .. Asks for pass
chsh -s $(which zsh)

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

# awesome go tools
go get github.com/rogpeppe/godef
go get github.com/nsf/gocode
go get golang.org/x/tools/cmd/guru
go get github.com/spf13/hugo

# Dropbox
# https://www.dropbox.com/install-linux
# Headless
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# Somewhere down the line...
# this asks for a user/pass and sets up ~/Dropbox
~/.dropbox-dist/dropboxd

# Setup keepass with dropbox
keepass2
