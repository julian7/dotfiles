function pathadd {
  [[ -d "$1" ]] && path=("$1" ${path:#$1})
}

which joe > /dev/null || alias joe=vim
if which mvim > /dev/null
then
  alias vi=mvim
  alias gvim=mvim
else
  alias vi=vim
fi

for i in $HOME/.zsh/*.zsh; do
  source $i
done

alias grep='grep -a --color=always'