if test $(uname) = "Darwin"; then
  update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
    printf '\e]0;%s\a' ${PWD/#$HOME/\~}
  }
  autoload add-zsh-hook
  add-zsh-hook chpwd update_terminal_cwd
  update_terminal_cwd

  alias ldd='otool -L'

  # use reattach with tmux if there is one
  if which reattach-to-user-namespace >/dev/null; then
    export REATTACH_CMD="reattach-to-user-namespace"
    export REATTACH_SHELL="$REATTACH_CMD -l zsh"
  fi
fi
