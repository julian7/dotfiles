function pathadd {
  [[ -d "$1" ]] && path=("$1" ${path:#$1})
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
