function pathadd {
  dir="$1"
  test -d "$dir" && path=("$dir" ${path:#$dir})
}

source $HOME/.zsh/*.zsh

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

alias t='tmux -u'
alias grep='grep --color=always'
