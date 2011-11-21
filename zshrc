function pathadd {
  [[ -d "$1" ]] && path=("$1" ${path:#$1})
}

for i in $HOME/.zsh.d/*.zsh; do
  source $i
done

alias grep='grep -a --color=always'
which ack-grep > /dev/null && alias ack=ack-grep

test $HOME/.zshrc.local && source $HOME/.zshrc.local
