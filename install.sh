#!/usr/bin/env bash

echo 'Dotfiles - zener79'

for DOTFILE in `find ~/.dotfiles/link`
do
  [ -f “$DOTFILE” ] && ln -sv “$DOTFILE” ~
done


sudo apt-get -qq update
sudo apt-get -qq install git-core silversearcher-ag tmux vim

# Backups, swaps and undos are stored here.
mkdir -p ~/.dotfiles/caches/vim

# Download Vim plugins.
if [[ "$(type -P vim)" ]]; then
  vim +PlugUpgrade +PlugUpdate +qall
fi

# Fast directory switching
mkdir -p $DOTFILES/caches/z
_Z_NO_PROMPT_COMMAND=1
_Z_DATA=$DOTFILES/caches/z/z
. $DOTFILES/bin/z.sh
