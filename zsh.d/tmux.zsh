alias t="tmux -u"
alias tvh="tmux split-window -p75 '$REATTACH_CMD vim .'"

function _set_tmux_title() {
  local title=${1:-${HOST#*.}}
  [[ ${TERM#screen} != $TERM ]] && printf "\ek%s\e\\" $title
  [[ ${TERM#xterm}  != $TERM ]] && printf "\e]0;%s\a" $title
}

_set_tmux_title

function ssh() {
  command ssh "$@"
  _set_tmux_title
}
