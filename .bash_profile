for DOTFILE in `find ~/.dotfiles/source`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

. ~/.dotfiles/bin/z.sh
