function pathadd {
  [[ -d "$1" ]] && path=("$1" ${path:#$1})
}

for i in $HOME/.zsh.d/*.zsh; do
  source $i
done

alias grep='grep -a --color=always'