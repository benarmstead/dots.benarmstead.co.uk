ZSH_THEME="purify"
plugins=(git)
#zsh-autosuggestions zsh-syntax-highlighting

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY


alias gup="git add . && git commit -m 'Update' && git push"
alias ls='exa --icons -taghl --group-directories-first --color=always'
alias lf=~/.config/lf/lfub

export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
