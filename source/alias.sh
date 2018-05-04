alias ..='cd ..'
alias ...='cd ../..'
alias fs="stat -f '%z bytes'"
alias df="df -h"

if [[ "$(type -P tree)" ]]; then
  alias ll='tree --dirsfirst -aLpughDFiC 1'
  alias lsd='ll -d'
else
  alias ll='ls -l'
  alias lsd='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
fi

# Always use color output for `ls`
alias ls="command ls --color"
alias lla="ls -la"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

alias update="sudo apt-get -qq update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias search="apt-cache search"

alias rs='rails s -b 0.0.0.0'
alias rc='rails c'

alias gp='git push'
alias gpo='git push origin master'
alias gph='git push heroku master'
alias hrrc='heroku run rails c'
alias gps='git push staging master'
alias gpp='git push production master'
alias gpa='gp --all'
alias gu='git pull'
alias gl='git log'
alias gg='gl --decorate --oneline --graph --date-order --all'
alias gs='git status'
alias gst='gs'
alias gd='git diff'
alias gdc='gd --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gba='git branch -a'
function gc() { git checkout "${@:-master}"; } # Checkout master by default
alias gco='gc'
alias gcb='gc -b'
alias gbc='gc -b' # Dyslexia
alias gr='git remote'
alias grv='gr -v'
alias gra='git remote add'
alias grr='git remote rm'
alias gcl='git clone'
