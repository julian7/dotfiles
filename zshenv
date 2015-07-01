export PAGER=less
export LESS="-R -m"
HISTFILE=$HOME/.zshist
HISTSIZE=1000
SAVEHIST=2000
PROMPT='%n@%m [%F{blue}%~%f]$(__git_prompt_info " %%F{green}‹%s›%%f") %# '
WORDCHARS=${WORDCHARS/\//}
test -f $HOME/.zshenv.local && source $HOME/.zshenv.local
