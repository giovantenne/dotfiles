# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

export PATH=$PATH:$HOME/.local/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/claudio/google-cloud-sdk/path.bash.inc' ]; then . '/home/claudio/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/claudio/google-cloud-sdk/completion.bash.inc' ]; then . '/home/claudio/google-cloud-sdk/completion.bash.inc'; fi

alias k=kubectl
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

alias gp='git push'
alias ga='git add .'
alias gp='git push'
alias gpa='git push --all'
alias gpo='git push origin master'
alias gph='git push heroku master'
alias gpp='git push production master'
alias gpomp='git push origin master:production'
alias hrrc='heroku run rails c'
alias hrrcp='heroku run rails c -r production'
alias gl='git log'
alias gs='git status'
alias gma='git commit -am'
alias gb='git branch'
alias gd='git diff'
alias tig='tig --all'
alias doco='docker-compose'
alias pio='~/.platformio/penv/bin/platformio'

function md() {
  mkdir -p "$@" && cd "$@"
}

HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k

# Initialize mise so its shims (mvn, node, ruby, etc.) are always on PATH.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate bash)"
fi
