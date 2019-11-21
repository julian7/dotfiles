export PAGER=less
export LESS="-R -m"
export HISTFILE=$HOME/.zshist
export HISTSIZE=1000
export SAVEHIST=2000
export WORDCHARS=${WORDCHARS/\//}
test -f $HOME/.zlogin.local && source $HOME/.zlogin.local || true
