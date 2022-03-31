ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
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
