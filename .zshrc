export ZSH="$HOME/.oh-my-zsh"

export NNN_PLUG='o:fzopen;d:diffs;v:imgview;j:autojump;p:pskill'
export NNN_OPTS="Hd"
export GIT_FUZZY_BRANCH_WORKING_COPY_KEY="Ctrl-P"
export GIT_FUZZY_BRANCH_MERGE_BASE_KEY="Ctrl-M"
export GIT_FUZZY_BRANCH_COMMIT_LOG_KEY="Ctrl-L"
export GIT_FUZZY_BRANCH_CHECKOUT_KEY="Ctrl-F"
export GIT_FUZZY_BRANCH_DELETE_BRANCH_KEY="Ctrl-D"
export GIT_FUZZY_COMMIT_KEY="Ctrl-A"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zoxide kubectl docker docker-compose zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="/Users/jpcrs/.local/bin:$PATH"
export PATH="/Users/jpcrs/.local/bin/git-fuzzy/bin:$PATH"
export PATH="$(asdf where dotnet):$PATH"