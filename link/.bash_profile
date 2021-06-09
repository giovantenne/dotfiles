. ~/.dotfiles/bin/z.sh

for DOTFILE in `find ~/.dotfiles/source`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

source <(kubectl completion bash)
complete -F __start_kubectl k

eval "$(rbenv init -)"

