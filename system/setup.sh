#!/usr/local/bin/zsh
cp ~/dotfiles/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/dotfiles/.p10k.zsh ~/.p10k.zsh
cp ~/dotfiles/dotfiles/env.sh ~/env.sh
cp ~/dotfiles/dotfiles/functions.sh ~/functions.sh 

# install oh-my-zsh addons
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# make home bin folder
if [ ! -d ~/bin/ ]; then
  mkdir ~/bin/
fi



# Install things in os specific manner:
if [ "$(uname)" == "Darwin" ]
then
    # Do something under Mac OS X platform 
    # Install Brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    cp ~/dotfiles/dotfiles/Brewfile ~/Brewfile
    brew bundle
    echo 'alias cat="bat"' > ~/env.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then
    # Do something under GNU/Linux platform
    # Install npm
    sudo apt install npm
    # install utilities
    sudo npm i -g gitmoji-cli
    sudo apt-get install fzf
    sudo apt install bat
    echo 'alias cat="batcat"' > ~/env.sh
    # Install Prettyping
    curl https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping > $HOME/bin/prettyping
    sudo chmod +x $HOME/bin/prettyping
    echo 'alias ping="$HOME/bin/prettyping --noloegend"' > ~/env.sh
fi
