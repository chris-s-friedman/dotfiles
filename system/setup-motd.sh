#!/usr/bin/env

cp ~/dotfiles/mot

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install things in os specific manner:
if [ "$(uname)" == "Darwin" ]
then
    # Install Brew
    brew install macvim cmake python3 mono go nodejs
    cd ~/.vim/bundle/YouCompleteMe
    /usr/local/bin/python3 install.py --all
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then
    # Do something under GNU/Linux platform
    sudo apt install build-essential cmake vim-nox python3-dev
    apt install mono-complete golang nodejs default-jdk 
    cd ~/.vim/bundle/YouCompleteMe
    python3 install.py --all
fi
