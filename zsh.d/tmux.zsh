alias t="tmux -u"
alias tvh="tmux split-window -p75 'reattach-to-user-namespace vim .'"

function _set_tmux_title() {
  [[ ${TERM#screen} != $TERM ]] && printf "\033k%s\033\\" ${1:-$(basename $SHELL)}
}

_set_tmux_title ${HOST%%.*}

function ssh() {
  command ssh "$@"
  _set_tmux_title $HOST${HOST%%.*}
}
