#!/usr/local/bin/zsh

# Set vim to be default editor
export EDITOR=vim

# Aliases
alias mkdir="mkdir -p"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias envconfig="vim ~/env.sh"
alias vimconfig="vim $HOME/.vimrc"
alias add-key="ssh-add ~/.ssh/id_rsa"
alias zshrc="source ~/.zshrc"
alias cat="bat"
alias ping="~/bin/prettyping --nolegend" # https://github.com/denilsonsa/prettyping
alias cat="bat" # https://github.com/sharkdp/bat
alias vstart="source ./venv/bin/activate && python -V"
alias cpwd="echo $(pwd) | pbcopy"
alias fe='fzf' # https://github.com/junegunn/fzf
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias hs='history | grep '
alias py='python '
alias R='R --no-save --no-restore'
alias docker-open='open --hide --background -a Docker'
alias gmoji='gitmoji -c' # https://github.com/carloscuesta/gitmoji-cli
alias publickey='cat ~/.ssh/id_rsa.pub -p | pbcopy'
alias clear_dns='sudo killall -HUP mDNSResponder'
alias gs='git status'
alias ..='cd ..'
alias ld="ls -ld */"
# List declared aliases, functions, paths

alias aliases="alias | sed 's/=.*//'"
alias paths='echo -e ${PATH//:/\\n}'
# Exports - place exports here
