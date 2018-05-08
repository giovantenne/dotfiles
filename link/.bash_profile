. ~/.dotfiles/bin/z.sh

for DOTFILE in `find ~/.dotfiles/source`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi


