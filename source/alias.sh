alias ..='cd ..'
alias ...='cd ../..'
alias fs="stat -f '%z bytes'"
alias df="df -h"

alias ll='ls -l'
alias lsd='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'

# Always use color output for `ls`
alias ls="command ls --color"
alias lla="ls -la"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

alias update="sudo apt-get -qq update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias search="apt-cache search"

alias k=kubectl
alias kube=kubectl
source <(kubectl completion bash)
complete -F __start_kubectl k


alias rs='rails server -b 0.0.0.0 -p 3000'
alias rc='rails c'
alias besk='bundle exec sidekiq'

alias es6='docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.2.4'
alias es5='sudo sysctl -w vm.max_map_count=262144; docker run -p 127.0.0.1:9200:9200 elasticsearch:5.0'

alias g='git'
alias gp='git push'
alias ga='git add .'
alias gpo='git push origin master'
alias gph='git push heroku master'
alias gpomp='git push origin master:production'
alias hrrc='heroku run rails c'
alias gps='git push staging master'
alias gpp='git push production master'
alias gpa='gp --all'
alias gu='git pull --only-ff'
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
alias tig='tig --all'
alias gfr='git fetch; git rebase origin/master'
