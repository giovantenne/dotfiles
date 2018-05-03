#!/usr/bin/env bash

echo 'Dotfiles - zener79'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mv $DIR ~/.dotfiles

for DOTFILE in `find ~/.dotfiles/link -maxdepth 1  | sed 1,1d`
do
  ln -sfv "$DOTFILE" ~/
done

ln -sfv ~/.dotfiles/.bash_profile ~/
source ~/.bash_profile
echo ". ~/.bash_profile" >> ~/.bashrc

# Backups, swaps and undos are stored here.
mkdir -p ~/.dotfiles/caches/vim

# Fast directory switching
mkdir -p ~/.dotfiles/caches/z

if [[ "$EUID" = 0 ]]; then
  apt-get -qq update
  apt-get -qq install git-core silversearcher-ag tmux vim
else
  sudo -k # make sure to ask for password on next sudo
  if sudo true; then
    echo "(2) correct password"
  else
    echo "(3) wrong password"
  fi
  sudo apt-get -qq update
  sudo apt-get -qq install git-core silversearcher-ag tmux vim
fi

# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  vim +PlugUpgrade +PlugUpdate +qall
fi
