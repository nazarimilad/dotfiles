# Shell aliases

## basic
alias :q='exit'
alias ls='ls --color=always --group-directories-first'
alias ll='ls -lh'
alias la='ls -hal'
alias lai='ls -hail'
alias bc="bc -q"

## git
alias gs='git status'
alias gS='git stash'
alias gSp='git stash pop'
alias ga='git add'
alias gd='git difftool'
alias gD='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gC='git checkout'
alias gf='git fetch'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gpra='git pull --rebase; git submodule --quiet sync; git submodule update --init --recursive'
alias gP='git push'
alias glog='git log'
alias gl="git log --graph --pretty=format:'%Cred%h %C(bold blue)%an %C(yellow)(%cr) %Cgreen%GK%C(yellow)%d%Creset%n%Creset%n%s%n'"
alias gr='git rebase'
alias gR='cd $(git rev-parse --show-toplevel)'
alias gbc='git remote prune origin'
alias gbc='git branch --merged | grep -v \* | xargs git branch -D'
alias gsmu='git submodule foreach git pull origin master'

## tmux
alias t='tmux'
alias tls='tmux ls'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tka='tmux kill-session -a'

## docker
alias d='docker'
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcu='docker-compose up'
alias di='docker images'
alias dk='docker kill'
alias dka='docker kill $(docker ps -q)'
alias dl='docker logs'
alias dp='docker ps'
alias dpa='docker ps -a'
alias drm='docker rm'
alias drma='docker rm $(docker ps -a -q)'
alias drmi='docker rmi'
alias drmia='docker rmi $(docker images -q)'
alias drmid='docker rmi $(docker images -q -f dangling=true)'
alias dv='docker volume'
alias dvp='docker volume prune'

## other
alias vim="/usr/bin/nvim"
alias wtf="/usr/bin/wtf/wtfutil"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias find="/usr/bin/fdfind"
