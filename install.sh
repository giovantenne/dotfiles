#!/usr/bin/env bash

echo 'Dotfiles - zener79'

APPS="git-core silversearcher-ag tmux vim"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mv $DIR ~/.dotfiles

for DOTFILE in `find ~/.dotfiles/link -maxdepth 1  | sed 1,1d`
do
  ln -sfv "$DOTFILE" ~/
done

ln -sfv ~/.dotfiles/.dotfiles_linker ~/
source ~/.dotfiles_linker

grep -q -F ". ~/.dotfiles_linker" ~/.bashrc || echo ". ~/.dotfiles_linker" >> ~/.bashrc

# Backups, swaps and undos are stored here.
mkdir -p ~/.dotfiles/caches/vim

git config --global user.email "claudio@benve.it"
git config --global user.name "Claudio Benvenuti"


if [[ "$EUID" = 0 ]]; then
  apt-get -qq update
  apt-get -qq install $APPS
else
  sudo apt-get -qq update
  sudo apt-get -qq install $APPS
fi

# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  vim +PlugUpgrade +PlugUpdate +qall
fi
