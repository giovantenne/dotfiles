. ~/.dotfiles/bin/z.sh

for DOTFILE in `find ~/.dotfiles/source`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

# if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
#     . ~/.bashrc
# fi

source <(kubectl completion bash)
complete -F __start_kubectl k
export USE_GKE_GCLOUD_AUTH_PLUGIN=True


# eval "$(rbenv init -)"

