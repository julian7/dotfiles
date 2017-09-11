function _powerline_precmd() {
    PROMPT="$(powerline-go -error $? -shell zsh -colorize-hostname)"
}

function _install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "_powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(_powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    whichX powerline-go && _install_powerline_precmd
fi

