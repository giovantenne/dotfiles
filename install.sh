#!/usr/bin/env bash

echo 'Dotfiles - zener79'

APPS="git-core silversearcher-ag tmux vim"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ $DIR != ~/.dotfiles ]]; then
  mv $DIR ~/.dotfiles
fi

for DOTFILE in `find ~/.dotfiles/link -maxdepth 1  | sed 1,1d`
do
  ln -sfv "$DOTFILE" ~/
done

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

# ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bash_profile
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bash_profile

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest


