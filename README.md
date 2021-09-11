# My personal dotfiles

If you're looking at this and you're not @chris-s-friedman:

1. IMHO, dotfiles are a set of very personal documents that _you_ should customize to best fit your preferences and experience
2. If you see something that looks wonky or have a question, don't hesitate to open an issue or make changes and make a PR

If you're looking at this and _you are @chris-s-friedman_:

**You should update README's more often.**

# Instructions

## Set up zsh

First step is to change shell to zsh and install ohmyzsh.

```sh
sh system/set_shell.sh
```

_Note_: if you're on a system that doesn't already have zsh, you'll have to install it:

```bash
sudo apt-get install git zsh
```

## Set up.... the rest

This runs on both linux and macos distros. it copies over the dotfils to user directory, and then installs files using the appropriate package manager, `brew` for macOS and `apt-get` for ubuntu.

```sh
sh system/setup.sh
```
