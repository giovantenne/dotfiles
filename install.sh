#!/usr/bin/env bash

echo 'Dotfiles - zener79'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mv $DIR ~/.dotfiles

for DOTFILE in `find ~/.dotfiles/link`
do
  [ -f “$DOTFILE” ] && ln -sv “$DOTFILE” ~
done



# Backups, swaps and undos are stored here.
mkdir -p ~/.dotfiles/caches/vim

# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  vim +PlugUpgrade +PlugUpdate +qall
fi

# Fast directory switching
mkdir -p ~/.dotfiles/caches/z
_Z_NO_PROMPT_COMMAND=1
_Z_DATA=~/.dotfiles/caches/z/z
. ~/.dotfiles/bin/z.sh

sudo apt-get -qq update
sudo apt-get -qq install git-core silversearcher-ag tmux vim
