export ZSH="$HOME/.oh-my-zsh"
export PATH="/Users/jpcrs/.local/bin:$PATH"
export PATH="/Users/jpcrs/.local/bin/git-fuzzy/bin:$PATH"
export PATH="$PATH:/Users/jpcrs/.dotnet"
# export PATH="$(asdf where dotnet):$PATH"
export DOTNET_ROOT="/Users/jpcrs/.dotnet"

export NNN_PLUG='o:fzopen;d:diffs;v:imgview;j:autojump;p:pskill'
export NNN_OPTS="Hd"
export GIT_FUZZY_BRANCH_WORKING_COPY_KEY="Ctrl-P"
export GIT_FUZZY_BRANCH_MERGE_BASE_KEY="Ctrl-M"
export GIT_FUZZY_BRANCH_COMMIT_LOG_KEY="Ctrl-L"
export GIT_FUZZY_BRANCH_CHECKOUT_KEY="Ctrl-F"
export GIT_FUZZY_BRANCH_DELETE_BRANCH_KEY="Ctrl-D"
export GIT_FUZZY_COMMIT_KEY="Ctrl-A"

export TMUX_FZF_OPTIONS="-p -w 80% -h 80% -m"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zoxide kubectl docker docker-compose zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh

eval "$(github-copilot-cli alias -- "$0")"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jpcrs/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jpcrs/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jpcrs/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jpcrs/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -n "$TERM" ]; then
  if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s general
  fi
fi
