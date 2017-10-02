export PAGER=less
export LESS="-R -m"
export HISTFILE=$HOME/.zshist
export HISTSIZE=1000
export SAVEHIST=2000
export PROMPT='%F{black}%K{yellow}%n@%m%F{yellow}%K{cyan}%F{black}%~$(__git_prompt_info "%%F{cyan}%%K{black}%%F{green} %s%%F{black}%%K{red}" "%%F{cyan}%%K{red}")%F{black}%#%F{red}%k%f '
export WORDCHARS=${WORDCHARS/\//}
test -f $HOME/.zlogin.local && source $HOME/.zlogin.local || true
