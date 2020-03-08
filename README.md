# My personal dotfiles

Currently I have dotfiles for:

* .zshrc (for my rpi)
* .vimrc

# ZSH

## Installation

Instructions cribbed from [here](https://www.uberbuilder.com/oh-my-zsh-on-raspberry-pi/).

1. update the pi

```bash
sudo apt-get update && sudo apt-get upgrade
```

2. Install git and zsh

```bash
sudo apt-get install git zsh
```

3. Make zsh default shell

```bash
chsh -s /bin/zsh
```

4. Install `oh-my-zsh`

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## ZSH Plugins

### ZSH Autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### ZSH Syntax Highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### ZSH Completions
```bash
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```
