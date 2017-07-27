export PAGER=less
export LESS="-R -m"
export HISTFILE=$HOME/.zshist
export HISTSIZE=1000
export SAVEHIST=2000
export PROMPT='%n@%m [%F{blue}%~%f]$(__git_prompt_info " %%F{green}‹%s›%%f") %# '
export WORDCHARS=${WORDCHARS/\//}
test -f $HOME/.zlogin.local && source $HOME/.zlogin.local
