ZSH_THEME="purify"
plugins=(git)
#zsh-autosuggestions zsh-syntax-highlighting

alias gup="git pull && git add . && git commit -m 'Update' && git push"
alias ls='exa --icons -taghl --group-directories-first --color=always'
alias lf=~/.config/lf/lfub

export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
