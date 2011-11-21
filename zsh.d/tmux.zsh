alias t="tmux -u"

function _set_tmux_title() {
  [[ ${TERM#screen} != $TERM ]] && printf "\033k%s\033\\" ${1:-$(basename $SHELL)}
}

function ssh() {
  _set_tmux_title $1
  command ssh "$@"
  _set_tmux_title
}