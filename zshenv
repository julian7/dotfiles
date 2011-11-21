PAGER=less
LESS="-R -m"
HISTFILE=$HOME/.zshist
HISTSIZE=1000
SAVEHIST=2000
PROMPT='%m:%~>>%# '
RPROMPT=' [%n:%l]'
test -f $HOME/.zshenv.local && source $HOME/.zshenv.local
