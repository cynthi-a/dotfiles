#!/bin/bash

which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing homebrew..."
    sleep 1
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

function installBrew() {
    if [ ! -d "/usr/local/Cellar/$1" ]; then
        echo "Installing $1..."
        sleep 1
        brew install $1 
    else
      echo "$1 is already installed."
    fi
}

function installCask() {
    if [ ! -d "/usr/local/Caskroom/$1" ]; then
        echo "Installing $1..."
        sleep 1
        brew cask install $1 
    else
      echo "$1 is already installed."
    fi
}

installBrew tmux
installBrew node
installBrew yarn
installCask whatsapp
installCask telegram
installCask spectacle
installCask spotify
installCask atom

if [ ! -d "/Library/Developer/CommandLineTools" ]; then
    xcode-select --install
fi

# Install Vim plugin manager
echo "Setting up vim and tmux config...";
if [ ! -d "$HOME/.vim/bundle/Vundle.vim/" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Get files from dotfiles repo
git clone https://github.com/cynthi-a/dotfiles.git $TMPDIR/dotfiles
cp $TMPDIR/dotfiles/.vimrc ~/.vimrc
cp $TMPDIR/dotfiles/.tmux.conf ~/.tmux.conf
cp $TMPDIR/dotfiles/.gitignore ~/.gitignore
echo "Setting up aliases..."
cp $TMPDIR/dotfiles/.bashrc ~/.bashrc
rm -rf $TMPDIR/dotfiles

# Source configuration files
echo "Sourcing config files..."
tmux source-file ~/.tmux.conf
git config --global core.excludesfile ~/.gitignore

echo "Installing vim plugins..."
vim +PluginInstall +qall

echo "Maximising key repeat..."
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms);
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

echo "Done!"
