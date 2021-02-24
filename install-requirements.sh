#!/usr/bin/env bash

# DESCRIPTION : install asdf manager 
# REQUIREMENTS : sudo
# USAGE1 : chmod +x install-asdf.sh && ./install-asdf.sh

# set asdf git url & versions
asdf_git="https//github.com/asdf-vm/asdf.git"
asdf_version="v0.8.0"
# requirements on linux (git or minimal with git-core)
sudo apt install curl git libssl-dev automake autoconf libncurses5-dev make gcc unzip 

# clone the latest branch via git
git clone $asdf_git ~/.asdf --branch $asdf_version
# add to your shell
read -p "What is your shell, Bash or ZSH ? enter [B or Z]: " my_shell
# add asdf to your shell
if [[ "$my_shell" = "B"||"b" ]]; then
# asdf bash
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
else
# asdf zsh
echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
# autocompletions or use ohmyzsh : update ~/.zshrc and add plugins asdf
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit
fi
# ending
echo "Installation done : Restart your shell by opening a new terminal"
# enter : asdf
