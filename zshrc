function pathadd {
  [[ -d "$1" ]] && path=("$1" ${path:#$1})
}


pathadd /usr/local/bin
pathadd $HOME/bin
which joe > /dev/null || alias joe=vim
if which mvim > /dev/null
then
  alias vi=mvim
  alias gvim=mvim
else
  alias vi=vim
fi

alias grep='grep --color=always'
for i in $HOME/.zsh/*.zsh; do
  source $i
done