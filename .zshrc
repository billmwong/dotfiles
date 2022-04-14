export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z fzf)
_Z_CMD=f
source $ZSH/oh-my-zsh.sh

# For a full list of active aliases, run `alias`.
# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gac="git add -A && git commit -m"
function gach { git add -A && git commit -m "$1" && git push }
alias gh="git push"
alias ghf="git push -f"
alias gp="git pull"
alias gch="git checkout"
alias gd="git diff"
alias gl='git log --graph --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'
alias gdc="git diff --cached"
alias grom="git rebase -i origin/master"
alias gfr="git fetch && git rebase -i origin/master"
alias ag="ag" # override ag -> apt-get alias
function gcob() {
    git checkout $(git for-each-ref --sort=-authordate:iso8601 --format='%(color:green)%(authordate:iso8601)%09%(color:white)%(refname:short)' refs/heads/ | fzf --height=40% --ansi | awk '{print $4}')
}
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # for gcob

function agr { ag -0 -l "$1" | xargs -0 sed -i "" "s/$1/$2/g"; } # ag and replace

# don't have a bash_profile by default on new machine
# source ~/.bash_profile

export PATH="/usr/local/opt/openssl@1.1/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"

bindkey -v # binds keys to vi-like bindings
bindkey "^R" fzf-history-widget
bindkey "^H" beginning-of-line
bindkey "^L" end-of-line
bindkey "^J" backward-word
bindkey "^K" forward-word
export KEYTIMEOUT=1 # 10ms

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias v=". venv/bin/activate"
