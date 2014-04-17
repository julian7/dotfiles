alias t="tmux -u"
alias tvh="tmux split-window -p75 '$REATTACH_CMD vim .'"

function _set_tmux_title() {
  [[ ${TERM#screen} != $TERM ]] && printf "\033k%s\033\\" ${1:-${HOST#*.}}
}

_set_tmux_title

function ssh() {
  command ssh "$@"
  _set_tmux_title
}
