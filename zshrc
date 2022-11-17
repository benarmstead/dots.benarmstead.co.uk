ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000

export PATH=/home/ben/.local/bin:$PATH

setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias gup="git add . && git commit -m 'Update' && git push"
alias ls="exa --icons -taghl --group-directories-first --color=always"
alias lf=~/.config/lf/lfub
alias grep='grep --color=auto'

export EDITOR=nvim

export ANDROID_HOME="/home/ben/Android/Sdk/"
alias "sudo"="doas"
export BW_SESSION="secret_key"

alias "up"="docker compose up web"
alias "stop"="docker stop $(docker ps -q)" 

alias "mgt"="docker compose exec web python src/manage.py makemigrations && docker compose exec web python src/manage.py migrate"
alias "fake"="docker compose exec web python src/manage.py migrate --fake"
alias "super"="docker compose exec web python src/manage.py createsuperuser"

alias "poet"="docker compose exec web poetry install"

alias "sync"="make sync-dev-db && make sync-media"

function push() {
    git add .
    git commit -a -m "$1"
    git push
}
